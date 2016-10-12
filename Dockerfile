# DOCKER-VERSION 1.11.1

# docker build -t="aaron8bit/hubot-c3po" .
# docker build -t="aaron8bit/hubot-c3po:base" .

FROM ubuntu:14.04
MAINTAINER Aaron Albert, aalbert@pillartechnology.com

ENV BOTDIR /opt/bot

RUN apt-get update && \
  apt-get install -y wget && \
  wget -q -O - https://deb.nodesource.com/setup_6.x | sudo bash - && \
  apt-get install -y git build-essential nodejs && \
  rm -rf /var/lib/apt/lists/* && \
  git clone --depth=1 https://github.com/aaron8bit/hubot-c3po.git ${BOTDIR}

WORKDIR ${BOTDIR}

RUN npm install
