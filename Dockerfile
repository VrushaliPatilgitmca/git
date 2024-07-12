
FROM python:3.12.4-slim
LABEL maintainer="Vrushali"
ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt requirements.txt
COPY ./webapp /webapp
COPY ./models/models.joblib/model.joblib models/models.joblib/model.joblib

WORKDIR /webapp
EXPOSE 8000

RUN python -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    /py/bin/pip install -r /requirements.txt && \
    adduser --disabled-password --no-create-home webapp

ENV PATH="/py/bin:$PATH"

USER webapp