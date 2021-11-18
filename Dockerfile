FROM ubuntu:latest

RUN apt update && apt upgrade -y

FROM python:latest

RUN python -m venv env
ENV VIRTUAL_ENV /env
ENV PATH /env/bin:$PATH
RUN pip install -U pip
RUN mkdir /INFINATO/
WORKDIR /INFINATO/
COPY . /INFINATO/
RUN pip install -U -r requirements.txt
CMD python -m flask run -host=0.0.0.0