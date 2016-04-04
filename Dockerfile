FROM phusion/baseimage:0.9.18
MAINTAINER R0GGER

RUN apt-get update && apt-get install -y \
        unzip \
        md5deep \
        wget \
        xmlstarlet \
        cabextract \
        genisoimage

#ENV WIN=w61-x64 \
#    OFFICE=sickrage \
#    EXTRA= \
#    OPTOINS=iso etc \
#    LANG=nld

VOLUME ["/app/wsusoffline"]

ADD crons.conf /app/crons.conf
ADD run.sh /app/run.sh
ADD update.sh /etc/my_init.d/update.sh

RUN crontab /app/crons.conf
RUN cron

RUN chmod +x /app/run.sh
RUN chmod +x /etc/my_init.d/update.sh

CMD ["/sbin/my_init"]
