# Dockerfile

FROM balenalib/raspberry-pi:buster

MAINTAINER zigler zhang <zigler.zhang@gmail.com>

# Update
RUN apt-get update -qq  && \
	apt-get install -qq lirc --no-install-recommends  && \
	apt-get clean && \
	rm -rf /var/lib/apt-lists/* /tmp/* /var/tmp/ && \
	echo 'dtoverlay=gpio-ir' >> /boot/config.txt


ADD files/lirc_options.conf  /etc/lirc/lirc_options.conf
ADD files/start.sh /data/start.sh

# Define working directory
WORKDIR /data

EXPOSE 8765

# Define default command
ENTRYPOINT [ "/data/start.sh" ]




