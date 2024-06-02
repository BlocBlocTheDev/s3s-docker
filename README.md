🦑 s3s + Docker 🐳
=====

Fork from **[s3s](https://github.com/frozenpandaman/s3s)** by **[frozenpandaman](https://github.com/frozenpandaman)**.

Edited for Docker Usage by **[BlocBlocTheBloc](https://github.com/BlocBlocTheDev)**

# FR :

s3s est un script qui télécharge les données de bataille de Splatoon 3 depuis le service SplatNet 3 (une partie de l'application Nintendo Switch Online) vers stat.ink, un site pour enregistrer, visualiser et agréger les statistiques de la série de jeux Splatoon. Ce script fonctionne sur l'architecture Docker.

## Usage via Docker 🐳

Outils nécessaires :
1. Config.txt extrait de **[s3s](https://github.com/frozenpandaman/s3s)**
2. Instance Docker fonctionnelle
3. Portainer (Le tuto est fait pour Portainer mais marche aussi sans et sera différent)

Les étapes nécessaires à l'utilisation de s3s via Docker

### Étape 1 - Config.txt

Pour faire fonctionner **[s3s-docker](https://github.com/BlocBlocTheDev/s3s-docker)**, vous devez d'abord avoir récupéré les informations de Config.txt après avoir lancé une première fois **[s3s](https://github.com/frozenpandaman/s3s)** sur votre ordinateur.

**[s3s-docker](https://github.com/BlocBlocTheDev/s3s-docker)** ne permet pas de configurer les tokens de lui-même.

Gardez bien ce fichier sur votre ordinateur.

### Étape 2 - Créer une image

Pour commencer, il vous faut créer une image Docker via un Dockerfile.

Pour cela, rendez-vous dans les releases **[s3s-docker releases](https://github.com/BlocBlocTheDev/s3s-docker/releases)**.

Téléchargez le Dockerfile de la version.

Allez dans votre espace Portainer.

Dans la catégorie Image, puis dans "Build a new Image".

Dans le nom de l'image, mettez : "s3s:?".

? sera à remplacer par le numéro de la dernière version disponible dans **[s3s-docker releases](https://github.com/BlocBlocTheDev/s3s-docker/releases)**.

Puis, dans "Web editor", collez le contenu du Dockerfile téléchargé.

Cliquez ensuite sur "Build the image".

### Étape 3 - Configurer s3s

Maintenant que vous avez votre image de s3s dans Docker, il faut la paramétrer.

Allez dans la catégorie Stacks, puis cliquez sur "Add Stack".

Donnez un nom à votre Stack, par exemple "s3s".

Puis, dans "Web Editor", collez ce code :

```
version: '3'
services:
  s3s-docker:
    container_name: S3S
    image: blocblocthedev/s3s-docker:[?]
    environment:
      - api_key=[VOTRE API KEY]
      - acc_loc=[VOTRE RÉGION]
      - gtoken=[VOTRE GTOKEN]
      - bullettoken=[VOTRE BULLET TOKEN]
      - session_token=[VOTRE SESSION TOKEN]
    restart: unless-stopped

```

Remplacez ensuite :
- [?] -> Dernière version dans **[s3s-docker releases](https://github.com/BlocBlocTheDev/s3s-docker/releases)**
- [VOTRE API KEY] -> La valeur entre "" de **api_key** dans **Config.txt**
- [VOTRE RÉGION] -> La valeur entre "" de **acc_loc** dans **Config.txt**
- [VOTRE GTOKEN] -> La valeur entre "" de **gtoken** dans **Config.txt**
- [VOTRE BULLET TOKEN] -> La valeur entre "" de **bullettoken** dans **Config.txt**
- [VOTRE SESSION TOKEN] -> La valeur entre "" de **session_token** dans **Config.txt**

Et cliquez sur "Deploy the Stack".

Vous aurez ensuite dans votre liste de "Containers" une ligne nommée "S3S" avec comme statut "running".

### Assistance

Si vous rencontrez des problèmes en souhaitant mettre en Docker votre s3s, reprenez le tutoriel avant de créer une **[Issue](https://github.com/BlocBlocTheDev/s3s-docker/issue)**.

## Que fait le container ?

Quand votre container est déployé et fonctionne, voici ce qu'il se passe :

1. Vérifie si des matchs n'ont pas été importés sur Stat.ink (Si c'est le cas alors il les importe).
2. Mise en mode passif, vérifie toutes les 5 minutes si de nouveaux matchs n'ont pas été importés (Si c'est le cas alors il les importe).

## Suite du projet **[s3s-docker](https://github.com/BlocBlocTheDev/s3s-docker/)**

Ce projet sera maintenu par **[BlocBlocTheBloc](https://github.com/BlocBlocTheDev)** pendant une durée indéterminée.

Checklist des futurs ajouts (Possible mais pas sûr) :
- [] Option durée mode passif

Et bien d'autres...

## Déclaration de licence et de copyleft - Par **[frozenpandaman](https://github.com/frozenpandaman)**

s3s est un _logiciel libre_ sous licence [GPLv3](https://www.gnu.org/licenses/gpl-3.0.html). Cela signifie que vous avez la _liberté_ – d'exécuter, modifier, copier, partager et redistribuer ce travail comme bon vous semble, tant que les œuvres dérivées sont également distribuées sous ces mêmes termes ou des termes équivalents.

Le droit d'auteur est une invention humaine récente, confuse et souvent inutile. Les bibliothèques, par exemple, existent depuis des milliers d'années, et leur rôle essentiel dans la "promotion de la science" et "l'encouragement de l'apprentissage" a été reconnu bien avant la promulgation des premiers statuts sur le droit d'auteur. Si le premier humain ayant eu l'idée d'un marteau l'avait revendiquée comme sa propriété intellectuelle, nous n'aurions pas progressé très loin en tant qu'espèce. Veuillez envisager de partager votre travail ouvertement avec le monde. _(déclaration adaptée de [ici](https://tspace.library.utoronto.ca/bitstream/1807/89456/1/Katz%20Copyright%2C%20Exhaustion.pdf) et [ici](https://rickey.info/about/))_

Bien qu'il s'agisse d'un projet libre et open-source, sa licence nécessite **une attribution**. **Si vous utilisez une partie de s3s, splatnet2statink, `iksm.py`, etc. dans votre projet, _veuillez fournir un lien vers ce dépôt_**. J'ai passé plus d'une demi-décennie et des centaines d'heures de mon temps personnel sur ces projets pour la communauté Splatoon – donc, au moins, un peu de crédit serait apprécié. :) Les dons, via le bouton "Sponsor" en haut ou les liens dans la barre latérale, sont également grandement appréciés. Merci, et restez frais ! –eli ＜コ:彡

# ENG  - Partly from **[s3s README](https://github.com/frozenpandaman/s3s/blob/master/README.md)** :

**s3s** is a script that uploads _Splatoon 3_ battle data from the SplatNet 3 service (part of the Nintendo Switch Online app) to **[stat.ink](https://stat.ink/)**, a site for recording, visualizing, and aggregating statistics from the *Splatoon* series of games. This script runs on Docker architecture.

## Usage via Docker 🐳

Required tools:
1. Config.txt extracted from **[s3s](https://github.com/frozenpandaman/s3s)**
2. A functional Docker instance
3. Portainer (The tutorial is made for Portainer but also works without it and will be different)

Les étapes nécessaires à l'utilisation de s3s via Docker

### Step 1 - Config.txt

To run **[s3s-docker](https://github.com/BlocBlocTheDev/s3s-docker)**, you must first have obtained the information from Config.txt after running **[s3s](https://github.com/frozenpandaman/s3s)** on your local computer for the first time.

**[s3s-docker](https://github.com/BlocBlocTheDev/s3s-docker)** does not allow configuring the tokens by itself.

Keep this file on your computer.

### Step 2 - Create an image

To begin, you need to build a Docker image via a Dockerfile.

To do this, go to the releases **[s3s-docker releases](https://github.com/BlocBlocTheDev/s3s-docker/releases)**.

Download the Dockerfile of the version.

Go to your Portainer space.

In the Image category, then in "Build a new Image".

In the image name, put: "s3s:?".

? should be replaced by the latest version number available in **[s3s-docker releases](https://github.com/BlocBlocTheDev/s3s-docker/releases)**.

Then, in "Web editor", paste the content of the downloaded Dockerfile.

Then click on "Build the image".

### Step 3 - Configure s3s

Now that you have your s3s image in Docker, you need to configure it.

Go to the Stacks category, then click on "Add Stack".

Give a name to your Stack, for example, "s3s".

Then, in "Web Editor", paste this code:

```
version: '3'
services:
  s3s-docker:
    container_name: S3S
    image: blocblocthedev/s3s-docker:[?]
    environment:
      - api_key=[YOUR API KEY]
      - acc_loc=[YOUR REGION]
      - gtoken=[YOUR GTOKEN]
      - bullettoken=[YOUR BULLET TOKEN]
      - session_token=[YOUR SESSION TOKEN]
    restart: unless-stopped

```

Remplacez ensuite :
- [?] -> Latest version in **[s3s-docker releases](https://github.com/BlocBlocTheDev/s3s-docker/releases)**
- [YOUR API KEY] -> The value between "" of **api_key** in **Config.txt**
- [YOUR REGION] -> The value between "" of **acc_loc** in **Config.txt**
- [YOUR GTOKEN] -> The value between "" of **gtoken** in **Config.txt**
- [YOUR BULLET TOKEN] -> The value between "" of **bullettoken** in **Config.txt**
- [YOUR SESSION TOKEN] -> The value between "" of **session_token** in **Config.txt**

And click on "Deploy the Stack".

You will then have a line named "S3S" in your "Containers" list with the status "running".

### Assistance

If you encounter problems when trying to Docker your s3s, review the tutorial before creating an **[Issue](https://github.com/BlocBlocTheDev/s3s-docker/issue)**.

## What does the container do?

When your container is deployed and running, here is what happens:

1. Checks if matches have not been imported on Stat.ink (If so, then it imports them).
2. Enters passive mode, checks every 5 minutes if new matches have not been imported (If so, then it imports them).

## Future of the project **[s3s-docker](https://github.com/BlocBlocTheDev/s3s-docker/)**

This project will be maintained by **[BlocBlocTheBloc](https://github.com/BlocBlocTheDev)** for an indefinite period.

Checklist of future additions (Possible but not certain):
- [] Passive mode duration option

And many more...

## License & copyleft statement - By **[frozenpandaman](https://github.com/frozenpandaman)**

s3s is _free software_ licensed under **[GPLv3](https://www.gnu.org/licenses/gpl-3.0.html)**. This means that you have _freedom_ – to run, modify, copy, share, and redistribute this work as you see fit, as long as derivative works are also distributed under these same or equivalent terms.

Copyright is a recent, confusing, and often unnecessary human invention. Libraries, for example, predate copyright by thousands of years, and their integral role in the "promotion of science" and "encouragement of learning" was acknowledged even before the first copyright statutes were enacted. If the first human who had the idea of a hammer claimed it as their intellectual property, we wouldn't have gotten very far as a species. Please consider sharing your work openly with the world. _(statement adapted from **[here](https://tspace.library.utoronto.ca/bitstream/1807/89456/1/Katz%20Copyright%2C%20Exhaustion.pdf)** and **[here](https://rickey.info/about/)**)_

While this is a free/libre and open-source project, its license does require **attribution**. **If you are using any part of s3s, splatnet2statink, `iksm.py`, etc. in your project, _please provide a link back to this repository_**. I have spent over half a decade and hundreds of hours of my personal time on these projects for the Splatoon community – so, at the least, some credit would be nice. :) Donations, via the "Sponsor" button at the top or links in the sidebar, are also greatly appreciated. Thank you, and stay fresh! –eli ＜コ:彡