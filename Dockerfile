FROM python:3.10.4-slim-bullseye

ENV PYTHONFAULTHANDLER=1 \
  PYTHONUNBUFFERED=1 \
  PYTHONHASHSEED=random \
  PIP_NO_CACHE_DIR=off \
  PIP_DISABLE_PIP_VERSION_CHECK=on \
  PIP_DEFAULT_TIMEOUT=100 \
  PIPENV_HIDE_EMOJIS=true \
  PIPENV_COLORBLIND=true \
  PIPENV_NOSPIN=true


# System deps:

RUN apt-get update && apt-get install -y --no-install-recommends gcc curl git

# Creating folders, and files for a project:

COPY . /code
WORKDIR /code


# Project initialization:

RUN pip install pipenv --no-cache-dir && pipenv install --deploy --system --ignore-pipfile

#
#FROM python:3.10.4-slim-bullseye as base
#
## Setup env
#ENV LANG C.UTF-8
#ENV LC_ALL C.UTF-8
#ENV PYTHONDONTWRITEBYTECODE 1
#ENV PYTHONFAULTHANDLER 1
#
#
#FROM base AS python-deps
#
## Install pipenv and compilation dependencies
#RUN pip install pipenv --no-cache-dir
#RUN apt-get update && apt-get install -y --no-install-recommends gcc
#
## Install python dependencies in /.venv
#COPY Pipfile .
#COPY Pipfile.lock .
#RUN PIPENV_VENV_IN_PROJECT=1 pipenv install --system --deploy --ignore-pipfile
#
#
#FROM base AS runtime
#
## Copy virtual env from python-deps stage
#COPY --from=python-deps /.venv /.venv
#ENV PATH="/.venv/bin:$PATH"
#
## Create and switch to a new user
#RUN useradd --create-home appuser
#WORKDIR /home/appuser
#USER appuser
#
## Install application into container
#COPY . .
#
## Run the application
CMD ["app/bot.py"]