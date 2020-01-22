# Dockerfile
FROM balenalib/raspberry-pi:buster

MAINTAINER zigler zhang <zigler.zhang@gmail.com>

# Update
RUN apt-get update -qq  && apt-get install -qq --no-install-recommends \
	lirc \
	mosquitto-clients \
	> /dev/null && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/ && \
	echo 'dtoverlay=gpio-ir' >> /boot/config.txt && \
	mkdir -p /app/conf

VOLUME /var/run/lirc

WORKDIR /app


COPY files/lirc_options.conf  /etc/lirc/lirc_options.conf
COPY files/lircd.conf /etc/lirc/lircd.conf
COPY files/start.sh /app/start.sh
COPY files/lircrc /etc/lirc/lircrc



EXPOSE 8765

# Define default command
ENTRYPOINT [ "/app/start.sh" ]
