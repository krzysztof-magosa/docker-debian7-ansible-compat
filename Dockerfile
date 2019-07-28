FROM debian:wheezy

MAINTAINER Krzysztof Magosa <krzysztof@magosa.pl>

RUN \
  sed -i 's/deb\./archive./g' /etc/apt/sources.list && \
  sed -i '/updates/d' /etc/apt/sources.list && \
  sed -i '/security/d' /etc/apt/sources.list && \
  echo 'APT::Get::AllowUnauthenticated "true";' > /etc/apt/apt.conf.d/99-oldie && \
  echo 'Acquire::Check-Valid-Until "0";' >> /etc/apt/apt.conf.d/99-oldie && \
  apt-get update && \
  apt-get install -y --force-yes python sudo bash ca-certificates perl-base=5.14.2-21+deb7u3 && \
  apt-get clean
