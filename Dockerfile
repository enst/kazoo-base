FROM centos:6
MAINTAINER Bing Li <enst.bupt@gmail.com>

RUN useradd -r -g daemon -d /srv bigcouch \
    && useradd -r -g daemon -d /var/lib/rabbitmq rabbitmq \
    && useradd -r -g daemon freeswitch \
    && useradd -r -g daemon -d /opt/kazoo kazoo \
    && groupadd -r kamailio \
    && useradd -r -g kamailio kamailio

RUN curl -o /etc/yum.repos.d/2600hz.repo http://repo.2600hz.com/2600hz.repo

RUN mkdir -p /srv /var/log/bigcouch \
    /var/lib/rabbitmq/ \
    /var/log/freeswitch \
    /opt/kazoo/ /var/log/2600hz \
    /var/log/kamailio \
    /var/log/httpd

RUN chown bigcouch:daemon /srv /var/log/bigcouch -R \
    && rabbitmq:daemon /var/lib/rabbitmq/ -R \
    && freeswitch:daemon /var/log/freeswitch -R \
    && kazoo:daemon /opt/kazoo /var/log/2600hz -R \
    &&kamailio:kamailio /var/log/kamailio -R

VOLUME /srv
VOLUME /etc/kazoo
VOLUME /var/log
VOLUME /opt/kazoo/log

WORKDIR /opt/kazoo
