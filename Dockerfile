FROM phusion/baseimage:latest
MAINTAINER r0gger

RUN apt-get update
RUN apt-get install -y git wget cabextract hashdeep xmlstarlet trash-cli unzip
RUN apt-get clean -y
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV SYSTEMS="w100-x64"
ENV OFFICE="o2k16-x64"
ENV LANGUAGE="nld"
ENV PARAMS="-includesp -includecpp -includecpp -includewddefs8"
ENV SLEEP=48h

# WSUSOFFLINE
ADD update.sh /wsus/
ADD run.sh /wsus/
RUN ln -s /wsus/run.sh /etc/my_init.d/run.sh
RUN chmod +x /wsus/*.sh
RUN ln -s /wsus/wsusoffline/client /client

VOLUME ["/client"]
CMD ["/sbin/my_init"]
