FROM debian:jessie
MAINTAINER Sven Strack <sven@so36.net>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    python-software-properties \
    locales \
    supervisor \
    python-pip

RUN dpkg-reconfigure locales && \
    locale-gen C.UTF-8 && \
    /usr/sbin/update-locale LANG=C.UTF-8

RUN echo Europe/Amsterdam > /etc/timezone && \
    dpkg-reconfigure

ENV LC_ALL C.UTF-8

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV DEBIAN_FRONTEND newt

RUN pip install -r https://bitbucket.org/pypa/bandersnatch/raw/stable/requirements.txt

VOLUME /srv/pypi

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD bandersnatch.conf /etc/bandersnatch.conf

CMD ["/usr/bin/supervisord"]



