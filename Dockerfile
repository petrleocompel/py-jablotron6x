FROM python:2

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY jablotron ./
COPY main.py ./
COPY ja2mqtt.py ./

ENV SERIAL_PORT /dev/ttyUSB0
ENV MQTT_HOST localhost
ENV MQTT_PORT 1883
ENV TOPIC alarm


CMD [ "python", "-u", "./main.py", "--serial-port $SERIAL_PORT", "--host $MQTT_HOST", "--mqtt-port $MQTT_PORT", "--topic $TOPIC",]
