FROM debian:latest
RUN apt-get update -y
RUN apt-get install -y python3-pip python3-dev build-essential
RUN apt-get install -y nginx
RUN apt-get install -y vim
COPY . /app
COPY webapp.conf /etc/nginx/sites-available/webapp.conf
RUN ln -s /etc/nginx/sites-available/webapp.conf /etc/nginx/sites-enabled
RUN rm /etc/nginx/sites-enabled/default
WORKDIR /app
VOLUME /tmp
EXPOSE 5000
RUN pip3 install -r requirements/production.txt
CMD /app/start.sh
