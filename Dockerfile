FROM ubuntu:24.04

EXPOSE 3310/tcp

USER root
RUN apt update

WORKDIR /home/clamav
ADD ./config/freshclam.conf .
ADD ./config/apt-dependencies.json .

RUN apt install -y jq
RUN echo $(cat apt-dependencies.json | jq -r '."clamav-daemon"') >> tmp

RUN apt install -y clamav-daemon=$(cat apt-dependencies.json | jq -r '."clamav-daemon"')
RUN echo "TCPSocket 3310" >> /etc/clamav/clamd.conf
RUN /etc/init.d/clamav-freshclam stop

RUN freshclam --config-file freshclam.conf
RUN mkdir -p /run/clamav
RUN chown clamav:clamav /run/clamav

ADD ./entrypoint.sh ./

USER clamav
CMD ["sh", "entrypoint.sh"]
