FROM resin/rpi-raspbian:jessie

MAINTAINER Stefan Lemme <stefan.lemme@dfki.de>

RUN apt-get update && apt-get install -y --no-install-recommends \
    mpd \
  && rm -rf /var/lib/apt/lists/* \
  && apt-get clean

ADD mpd.conf /etc/mpd.conf
RUN mkdir -p /opt/music && \
    chown -R mpd /opt/music

ADD bootstrap.sh /
RUN chmod +x /bootstrap.sh

RUN mkdir -p /run/mpd && \
    chown -R mpd /run/mpd

EXPOSE 6600

ENTRYPOINT /bootstrap.sh

