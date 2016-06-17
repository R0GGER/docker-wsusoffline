FROM phusion/baseimage:0.9.18
MAINTAINER R0GGER

RUN apt-get update 
RUN apt-get install -y unzip md5deep wget xmlstarlet cabextract genisoimage tzdata python python-pip mercurial

ENV SYSTEMS="all-61 all-63 all-100"
ENV OFFICE="o2k13 o2k16"
ENV LANGUAGE="nld enu"
ENV PARAMS="/dotnet /msse /wddefs /wle"
ENV CRON="* 12 * * *"
ENV TIMEZONE="Europe/Amsterdam"

# WSUSOFFLINE
ADD update.sh /etc/my_init.d/update.sh
RUN chmod +x /etc/my_init.d/update.sh
RUN ln -s /app/wsusoffline/client /client
RUN ln -s /app/wsusoffline/iso /iso

# CRON
RUN pip install -e hg+https://bitbucket.org/dbenamy/devcron#egg=devcron
RUN mkdir /cron
ADD run.sh /cron/run.sh
RUN chmod a+x /cron/run.sh

VOLUME ["/client", "/iso"]
CMD ["/sbin/my_init", "devcron.py", "/cron/crontab"]
