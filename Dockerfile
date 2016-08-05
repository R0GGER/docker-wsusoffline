FROM phusion/baseimage:latest
MAINTAINER R0GGER

RUN apt-get update 
RUN apt-get install -y unzip md5deep wget xmlstarlet cabextract genisoimage tzdata

ENV SYSTEMS="all-61 all-63 all-100"
ENV OFFICE="o2k13 o2k16"
ENV LANGUAGE="nld enu"
ENV PARAMS="/dotnet /msse /wddefs /wle"
ENV CRON="daily"
ENV TIMEZONE="Europe/Amsterdam"

# WSUSOFFLINE
ADD update.sh /wsus/
ADD run.sh /wsus/
RUN ln -s /wsus/run.sh /etc/my_init.d/run.sh
RUN chmod +x /wsus/*.sh
RUN ln -s /wsus/wsusoffline/client /client
RUN ln -s /wsus/wsusoffline/iso /iso

VOLUME ["/client", "/iso"]
CMD ["/sbin/my_init"]
