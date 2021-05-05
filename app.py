from chillapi.api import ChillApi
from os import path

this_directory = path.abspath(path.dirname(__file__))

_resources = ChillApi(config_file=f'{this_directory}/api.yaml')
app = _resources.app
api_config = _resources.api_config
if __name__ == '__main__':
    app.run(
        debug=api_config['app']['debug'],
        host=api_config['app']['host'],
        port=api_config['app']['port']
    )
