FROM phusion/baseimage:latest
MAINTAINER r0gger

RUN apt-get update
RUN apt-get install -y wget cabextract hashdeep xmlstarlet trash-cli unzip iputils-ping genisoimage
RUN apt-get clean -y
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV SYSTEMS="w100-x64"
ENV OFFICE="o2k16-x64"
ENV LANGUAGE="enu"
ENV PARAMS="-includesp -includecpp -includedotnet -includewddefs8"
ENV ISO="no"
ENV SLEEP=48h

# WSUSOFFLINE
ADD update.sh /wsus/
ADD run.sh /wsus/
ADD download.sh /wsus/
RUN mkdir /etc/service/wsusoffline
RUN ln -s /wsus/run.sh /etc/service/wsusoffline/run
RUN chmod +x /wsus/*.sh
RUN ln -s /wsus/wsusoffline/client /client

VOLUME ["/client"]
CMD ["/sbin/my_init"]
