FROM phusion/baseimage:0.9.18
MAINTAINER R0GGER

RUN apt-get update 
RUN apt-get install -y unzip md5deep wget xmlstarlet cabextract genisoimage

ENV SYSTEM=all-x64
ENV OFFICE=ofc
ENV LANGUAGE=nld
ENV PARAMS="/dotnet /msse /wddefs /wle"

VOLUME ["/app/wsusoffline"]

ADD crons.conf /app/crons.conf
ADD run.sh /app/run.sh
ADD update.sh /etc/my_init.d/update.sh

RUN crontab /app/crons.conf
RUN cron

RUN chmod +x /app/run.sh
RUN chmod +x /etc/my_init.d/update.sh

CMD ["/sbin/my_init"]
