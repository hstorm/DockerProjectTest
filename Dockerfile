FROM python:3.8-slim as base


# Set the folder in which venv creates the environment
ENV WORKON_HOME /.venvs

RUN apt-get update 
RUN apt-get upgrade -y 
RUN apt-get install -y git

# Install & use pipenv
COPY Pipfile Pipfile.lock ./
RUN python -m pip install --upgrade pip
RUN pip install pipenv 
RUN pipenv install --dev

# Install application into container
COPY . .
# WORKDIR /app
# COPY . /app

