FROM centos:6
MAINTAINER Bing Li <enst.bupt@gmail.com>

RUN useradd -r -g daemon -d /srv bigcouch
RUN useradd -r -g daemon rabbitmq
RUN useradd -r -g daemon freeswitch
RUN useradd -r -g daemon -d /opt/kazoo kazoo
RUN groupadd -r kamailio && useradd -r -g kamailio kamailio

RUN curl -o /etc/yum.repos.d/2600hz.repo http://repo.2600hz.com/2600hz.repo

RUN mkdir -p /srv /var/log/bigcouch
RUN mkdir -p /var/lib/rabbitmq/
RUN mkdir -p /var/log/freeswitch
RUN mkdir -p /opt/kazoo/ /var/log/2600hz
RUN mkdir -p /var/log/kamailio
RUN mkdir -p /var/log/httpd

RUN chown bigcouch:daemon /srv /var/log/bigcouch -R
RUN chown rabbitmq:daemon /var/lib/rabbitmq/ -R
RUN chown freeswitch:daemon /var/log/freeswitch -R
RUN chown kazoo:daemon /opt/kazoo /var/log/2600hz -R
RUN chown kamailio:kamailio /var/log/kamailio -R

VOLUME /srv
VOLUME /etc/kazoo
VOLUME /var/lib/rabbitmq/
VOLUME /var/log
VOLUME /opt/kazoo/log"

WORKDIR /opt/kazoo
