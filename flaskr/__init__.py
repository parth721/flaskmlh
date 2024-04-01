import os
from . import db
from flask import Flask

def create_app(test_config=None):
    app = Flask(__name__)
    app.config.from_mapping(
        SECRET_KEY='mlh',
        DATABASE=os.path.join(app.instance_path, 'flask.sqlite')
    )

    if test_config is None :
        #load the instance config
        app.config.from_pyfile('config.py', silent=True)
    else :
        #load the test config if passed
        app.config.from_mapping(test_config)

    #ensure the instance folder exist
    try:
        os.makedirs(app.instance_path)
    except OSError:
        pass

#routing 
    @app.route('/')
    def home():
        return "helloworld"
    
    @app.route('/db')
    def database():
        connection = db.getdb()
    
    return app