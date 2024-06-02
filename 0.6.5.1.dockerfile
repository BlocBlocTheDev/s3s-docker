FROM python:3

RUN pip install --upgrade pip

WORKDIR /etc/s3s

RUN git clone --depth 1 --branch 0.6.5.1 --single-branch https://github.com/BlocBlocTheDev/s3s-docker.git .

RUN pip install -r requirements.txt

CMD ["python3", "s3s.py", "-r", "-M"]