FROM telegraf:alpine
RUN apk add --no-cache pip3 python3

RUN pip3 install fritzconnection
RUN apk add --no-cache git && \
  git clone https://github.com/Schmidsfeld/TelegrafFritzBox/ && \
  chmod +x ./TelegrafFritzBox/telegrafFritzBox.py && \
  chmod +x ./TelegrafFritzBox/telegrafFritzSmartHome.py && \
  cp ./TelegrafFritzBox/telegrafFritzBox.py /usr/local/bin && \
  cp ./TelegrafFritzBox/telegrafFritzSmartHome.py /usr/local/bin

ADD ./telegraf.conf /etc/telegraf/telegraf.conf
