FROM telegraf:alpine

USER root

WORKDIR /fritz

RUN apk add --no-cache python3 py3-pip


RUN python3 -m venv /fritz/venv
COPY ./requirements.txt /fritz/
RUN /fritz/venv/bin/pip install -r /fritz/requirements.txt

COPY ./telegrafFritzBox.py /fritz/
COPY ./telegrafFritzSmartHome.py /fritz/

RUN chmod +x /fritz/*.py

RUN ls -al /fritz/venv/bin/

ADD ./telegraf.conf /etc/telegraf/telegraf.conf

USER telegraf
