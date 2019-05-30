# py-jablotron6x
Library for interfacing with Jablotron 6x alarms by using the JA-80T serial cable.

Example usage:

```
python

>>> from jablotron import Jablotron6x
>>> with Jablotron6x("/dev/ttyUSB0") as j:
>>>   j.on_mode_change = lambda mode: print(str(mode))
>>>   j.send_keys('F06060')
>>>   j.send_keys('N')
```

More details about the [ja-6x protocol](https://github.com/pezinek/py-jablotron6x/wiki/Protocol) is in the wiki.

# Docker

> Right now you have to build docker image for yourself.

1. Clone repo
2. build docker image
3. run image

## Running docker image

| Variable      | Description    | Default value  |
|---------------|:--------------:|---------------:|
| SERIAL_DEVICE | Path to device | `/dev/ttyUSB0` |
| MQTT_HOST     | Host for MQTT  | localhost      |
| MQTT_PORT     | Port for MQTT  | 1883           |
| TOPIC         | Topic for MQTT | alarm          |


### Docker run
```
docker run -d -e SERIAL_DEVICE=/dev/ttyUSB0 -e MQTT_HOST=localhost -e MQTT_PORT=1883 -e TOPIC=alarm --device=/dev/ttyUSB0 py-jablotron

```  

### Docker-compose
```
version: '2'

services:
  jablotron:
    build: .
    restart: on-failure
    container_name: jablotron
    environment:
      - SERIAL_DEVICE=/dev/ttyUSB0
      - MQTT_HOST=localhost
      - MQTT_PORT=1883
      - TOPIC=alarm
    devices:
      - "/dev/ttyUSB0:/dev/ttyUSB0"
```  

