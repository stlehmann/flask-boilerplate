#! /bin/python3
import os

application_root = os.environ.get('APPLICATION_ROOT') or ''

content = (
    'server {\n'
    '    listen 80;\n'
    '    \n'
    '    location / {\n'
    '        proxy_pass http://localhost:5000;\n'
    '    }\n'
    '    \n'
    '    location ' + application_root + '/static/ {\n'
    '        alias /app/app/static/;\n'
    '    }\n'
    '}\n'
)

print(content)
