FROM python:3.9-slim-buster

WORKDIR /usr/src/app

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1


RUN pip install --upgrade pip
RUN pip install pipenv
COPY Pipfile Pipfile.lock
RUN pipenv install

COPY . .
CMD ["python", "main.py"]