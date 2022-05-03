FROM python:3.8-slim as base

# Setup env
# ENV LANG C.UTF-8
# ENV LC_ALL C.UTF-8
# ENV PYTHONDONTWRITEBYTECODE 1
# ENV PYTHONFAULTHANDLER 1


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
# && pipenv install --dev 


# FROM base AS python-deps

# # Install pipenv and compilation dependencies
# RUN pip install pipenv
# # RUN apt-get update && apt-get install -y --no-install-recommends gcc

# # Install python dependencies in /.venv
# COPY Pipfile .
# COPY Pipfile.lock .
# # RUN PIPENV_VENV_IN_PROJECT=1 pipenv install --deploy
# RUN PIPENV_VENV_IN_PROJECT=1 pipenv install --dev


# FROM base AS runtime

# Copy virtual env from python-deps stage
# COPY --from=python-deps /.venv /.venv
# ENV PATH="/.venv/bin:$PATH"

# # Create and switch to a new user
# RUN useradd --create-home appuser
# WORKDIR /home/appuser
# USER appuser

# Install application into container
COPY . .
# WORKDIR /app
# COPY . /app


# # Creates a non-root user and adds permission to access the /app folder
# RUN adduser -u 5678 --disabled-password --gecos "" appuser && chown -R appuser /app
# USER appuser

# # Run the application
# ENTRYPOINT ["python", "-m", "http.server"]
# CMD ["--directory", "directory", "8000"]

# CMD ["/opt/venvs/bin/python", "myapp.py"]

# CMD ["python", "test_python.py"]