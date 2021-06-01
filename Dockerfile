FROM bmoorman/alpine:3.8

RUN apk add --no-cache \
    python3 \
    py3-pip \
 && apk add --no-cache --virtual .build-deps \
    build-base \
    python3-dev \
 && pip3 install adafruit-circuitpython-dht RPi.GPIO requests \
 && apk del --no-cache .build-deps

COPY bin/ /usr/local/bin/

CMD ["sensor.py"]
