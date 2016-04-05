FROM phusion/baseimage:0.9.18
MAINTAINER R0GGER

RUN apt-get update 
RUN apt-get install -y unzip md5deep wget xmlstarlet cabextract genisoimage nano

ENV SYSTEMS="all-62 all-63 all-100"
ENV OFFICE="o2k10 o2k13 o2k16"
ENV LANGUAGE="nld enu"
ENV PARAMS="/dotnet /msse /wddefs /wle"

ADD crons.conf /app/crons.conf
ADD run.sh /app/run.sh
ADD update.sh /etc/my_init.d/update.sh

RUN crontab /app/crons.conf
RUN cron

RUN chmod +x /app/run.sh
RUN chmod +x /etc/my_init.d/update.sh
RUN ln -s /app/wsusoffline/client /client
RUN ln -s /app/wsusoffline/iso /iso

VOLUME ["/client"]
CMD ["/sbin/my_init"]
