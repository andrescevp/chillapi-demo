VENV_NAME?=venv
VENV_ACTIVATE=. ${VENV_NAME}/bin/activate
PYTHON=${VENV_NAME}/bin/python
DOCKER=docker exec -ti chillapi-test-api
DB_URL='postgresql+psycopg2://root:root@chillapi-test-postgres/chillapi'
ALEMBIC_CONFIG=postgres.alembic.ini
virtualenv:
	${DOCKER} virtualenv venv
run:
	${DOCKER} gunicorn --bind 0.0.0.0:8000 app:app
run_dev:
	${DOCKER} python -m app
init:
	${DOCKER} alembic -c ${ALEMBIC_CONFIG} upgrade head
