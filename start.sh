#! /bin/bash
service nginx start
gunicorn wsgi:application -b0.0.0.0:5000
