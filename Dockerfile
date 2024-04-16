FROM ubuntu:24.04

EXPOSE 6666/tcp

USER root
RUN apt update
RUN apt install -y clamav-daemon=1.0.5+dfsg-1.1ubuntu3
RUN echo "TCPSocket 6666" >> /etc/clamav/clamd.conf
RUN /etc/init.d/clamav-freshclam stop

WORKDIR /home/clamav
ADD ./config/freshclam.conf .
RUN freshclam --config-file freshclam.conf
RUN mkdir -p /run/clamav
RUN chown clamav:clamav /run/clamav

ADD ./entrypoint.sh ./

USER clamav
CMD ["sh", "entrypoint.sh"]
