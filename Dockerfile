FROM openjdk:14-jdk-alpine3.10

LABEL ORIGIN_MAINTAINER="Tien Tran"
LABEL MAINTAINER="ccclin"

RUN apk --no-cache --update add x11vnc openssl xvfb openbox xfce4-terminal supervisor sudo tar curl ttf-droid fontconfig

RUN fc-cache -f

# add alpine user with random password
RUN addgroup alpine \
&& adduser  -G alpine -s /bin/sh -D alpine \
&& echo "alpine:$(date | md5sum | head -c 32)" | /usr/sbin/chpasswd \
&& echo "alpine    ALL=(ALL) ALL" >> /etc/sudoers
# clean up apk cache
RUN rm -rf /apk /tmp/* /var/cache/apk/*
# install jmeter
RUN curl -fsSLO https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-5.2.1.tgz \
&& mkdir /opt/jmeter \
&& tar --strip-components=1 -xvzf apache-jmeter-5.2.1.tgz -C /opt/jmeter \
&& rm -rf apache-jmeter-5.2.1.tgz \
&& ln -s /opt/jmeter/bin/jmeter /usr/bin/jmeter

ADD etc /etc

WORKDIR /home/alpine
USER alpine

ENV RESOLUTION 1280x720x24

EXPOSE 5900

CMD ["/usr/bin/supervisord","-c","/etc/supervisord.conf"]
