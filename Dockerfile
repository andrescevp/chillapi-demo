FROM python:3.8-slim

RUN apt-get update
RUN apt-get install -y libpq-dev build-essential libgraphviz-dev graphviz
RUN apt-get install -y sqlite3 libsqlite3-dev
#RUN apt-get install -y default-libmysqlclient-dev  default-mysql-client

ARG APP_ENV='local'
ENV APP_ENV=${APP_ENV}
ENV PYTHONPATH "${PYTHONPATH}:/app"

COPY . /app
WORKDIR /app

RUN python -m pip install -U pip
RUN set -ex && \
    pip install -r requirements.txt

CMD gunicorn --log-level=debug --bind=0.0.0.0:8000 app:server
