FROM phusion/baseimage:master
MAINTAINER r0gger

RUN apt-get update && \
    apt-get install -y wget cabextract hashdeep xmlstarlet trash-cli unzip iputils-ping genisoimage aria2 rsync jq && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV SYSTEMS="w100-x64"
ENV OFFICE="o2k16-x64"
ENV LANGUAGE="enu"
ENV PARAMS="-includesp -includecpp -includedotnet -includemsse"
ENV ISO="no"
ENV SLEEP=48h
ENV DOWNLOADERS="aria2c wget"

# WSUSOFFLINE
ADD update.sh /wsus/
ADD run.sh /wsus/
ADD preferences.bash /wsus/
ADD download.sh /wsus/
RUN ln -s /wsus/run.sh /etc/my_init.d/run.sh
RUN chmod +x /wsus/*.sh
RUN ln -s /wsus/wsusoffline/client /client

VOLUME ["/client"]
CMD ["/sbin/my_init"]
