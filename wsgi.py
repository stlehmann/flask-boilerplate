import os
from app import create_app
from werkzeug.wsgi import DispatcherMiddleware

application_root = os.environ.get('APPLICATION_ROOT') or ''

app = create_app(os.getenv('FLASK_CONFIG') or 'default')
application = DispatcherMiddleware(
    None, {
        application_root: app
    }
)

if __name__ == '__main__':
    from werkzeug import run_simple
    run_simple('localhost', 5000, application, use_debugger=True)
