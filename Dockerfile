FROM jenkins/jenkins:lts-alpine

USER root
RUN apk update && apk upgrade

# set locale
RUN apk add --no-cache tzdata && cp /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime && echo "America/Sao_Paulo" > /etc/timezone

RUN apk --no-cache add make git

RUN apk --no-cache add openjdk11 --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk/

# skip initial setup
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

#RUN mkdir /srv/backup
#RUN chown jenkins:jenkins /srv/backup

#USER jenkins
#COPY plugins.txt /usr/share/jenkins/plugins.txt
#RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/plugins.txt

# initial config
COPY initial_config /var/tmp/initial_config/
