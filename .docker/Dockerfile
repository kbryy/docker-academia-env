FROM python:3.8

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install nodejs -y && apt-get install npm -y

COPY requirements.txt .
RUN pip3 install --upgrade pip && \
    pip3 install --no-cache-dir -r requirements.txt

RUN jupyter serverextension enable --py jupyterlab
RUN jupyter labextension install jupyterlab_vim

WORKDIR /home/mycode/
