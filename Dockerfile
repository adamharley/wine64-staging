FROM debian:stable-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN dpkg --add-architecture i386 && \
	apt-get update && \
	apt-get install --no-install-recommends --no-install-suggests -y apt-transport-https gnupg software-properties-common wget && \
	wget -qO - https://dl.winehq.org/wine-builds/winehq.key | apt-key add - && \
	apt-add-repository https://dl.winehq.org/wine-builds/debian && \
	apt-get update && \
	apt-get install --no-install-recommends --no-install-suggests -y winehq-staging && \
	apt-get purge -y apt-transport-https gnupg software-properties-common wget && \
	apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT ["wine"]