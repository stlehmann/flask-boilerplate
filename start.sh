#! /bin/bash
python3 create_nginx_configfile.py > /etc/nginx/sites-available/webapp.conf
service nginx start
gunicorn wsgi:application -b0.0.0.0:5000
