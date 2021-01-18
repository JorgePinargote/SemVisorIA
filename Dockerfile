FROM tiangolo/uwsgi-nginx:python3.8

LABEL Name=code6 Version=0.0.1
EXPOSE 80
ENV LISTEN_PORT=80

ENV UWSGI_INI uwsgi.ini
WORKDIR /app
ADD . /app
RUN chmod g+w /app
RUN chmod g+w /app/db.sqlite3
RUN chmod g+w /app/media

RUN python3 -m pip install -r requirements.txt

RUN apt-get update 
RUN apt-get install ffmpeg libsm6 libxext6  -y