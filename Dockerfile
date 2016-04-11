FROM debian:stable-backports
MAINTAINER R0GGER

RUN apt-get update 
RUN apt-get install -y unzip hashdeep wget xmlstarlet cabextract genisoimage tzdata python python-pip mercurial

ENV SYSTEMS="all-61 all-63 all-100"
ENV OFFICE="o2k10 o2k13 o2k16"
ENV LANGUAGE="nld enu"
ENV PARAMS="/dotnet /msse /wddefs /wle"
ENV CRON="* 12,0 * * *"
ENV TIMEZONE="Europe/Amsterdam"

# WSUSOFFLINE
ADD update.sh /app/update.sh
RUN chmod +x /app/update.sh
RUN ln -s /app/wsusoffline/client /client
RUN ln -s /app/wsusoffline/iso /iso
RUN ln -s /usr/bin/hashdeep /usr/bin/md5deep

# CRON
RUN pip install -e hg+https://bitbucket.org/dbenamy/devcron#egg=devcron
RUN mkdir /cron
ADD run.sh /cron/run.sh
RUN chmod a+x /cron/run.sh

VOLUME ["/client", "/iso"]
CMD ["/app/update.sh", "devcron.py", "/cron/crontab"]
