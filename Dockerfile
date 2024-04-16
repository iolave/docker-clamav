FROM ubuntu:24.04

EXPOSE 6666/tcp

USER root
RUN apt update
RUN apt install -y clamav-daemon
RUN /etc/init.d/clamav-freshclam stop
RUN echo "LogFileMaxSize 0" >> freshclam.conf
RUN echo "DatabaseDirectory /var/lib/clamav" >> freshclam.conf
RUN echo "LogSyslog no" >> freshclam.conf
RUN echo "DatabaseMirror database.clamav.net" >> freshclam.conf
RUN freshclam --config-file freshclam.conf

RUN echo "TCPSocket 6666" >> /etc/clamav/clamd.conf
RUN mkdir -p /run/clamav
RUN chown clamav:clamav /run/clamav

COPY ./entrypoint.sh ./

USER clamav
CMD ["sh", "entrypoint.sh"]
