FROM debian:latest
RUN apt-get update -y
RUN apt-get install -y python3-pip python3-dev build-essential
COPY . /app
WORKDIR /app
EXPOSE 5000
VOLUME /tmp
RUN pip3 install -r requirements/production.txt
CMD gunicorn wsgi:application -b0.0.0.0:5000
