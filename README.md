# Docker Demo

A sample Python Web application is used to illustrate the usage of Docker.

Setup:

- put an entry `127.0.0.1 redis` to `/etc/hosts`
- ensure Python 3.5.1 is installed
  - use `pyvenv-3.5 venv` to create a virtual environment in the project folder
  - use `source venv/bin/activate` to activate the environment
  - use `pip install -r requirements.txt` to install dependencies

## Development

- use `python server.py` to start a development server listening on port 8000

## Deployment

- use `./bin/start.sh` to start the uWSGI server listening on port 80000
