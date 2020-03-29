FROM python:3-alpine
MAINTAINER Lars von Wedel <vonwedel@me.com>

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN apk update && apk add bluez bluez-deprecated

COPY requirements.txt requirements.txt
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD [ "python3", "./miflora-mqtt-daemon.py", "--config_dir", "/config" ]
