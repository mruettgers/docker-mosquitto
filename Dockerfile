FROM hypriot/rpi-alpine
MAINTAINER Michael Ruettgers <michael@ruettgers.eu>

LABEL Description="Eclipse Mosquitto MQTT Broker"

RUN set -xe && \
	apk --no-cache update && \
    apk --no-cache add mosquitto && \
    mkdir -p /var/lib/mosquitto && \
    chown -R mosquitto:mosquitto /var/lib/mosquitto

VOLUME ["/etc/mosquitto", "/var/lib/mosquitto"]

EXPOSE 1883 9001

WORKDIR "/var/lib/mosquitto"

CMD ["/usr/sbin/mosquitto"]