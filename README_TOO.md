# Aaron's Notes on Making This

### Install nvm

I installed nvm on ubuntu using this install script (0.32.0 was latest at the time).
```
curl https://raw.githubusercontent.com/creationix/nvm/v0.32.0/install.sh > /tmp/install_nvm.sh
# Look at the script ;)
bash /tmp/install_nvm.sh
export NVM_DIR="/home/aja29/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
# not sure if this was needed but it seemed like a good idea
nvm install stable
```

### Install hubot with yeoman

```
mkdir hubot-c3po
cd hubot-c3po
git init
npm install -g yo generator-hubot
yo hubot
```

### Create/modify Dockerfile
```
vi Dockerfile
```

### Build the base docker image
```
# it builds up from ubuntu so it takes a while
docker build -t="aaron8bit/hubot-c3po" .
```

### Configure some details
You need to have a Google API key and a Slack API key.
```
cd ..
mkdir hubot-c3po-config
cd hubot-c3po-config
vi Dockerfile
```
This Dockerfile is not in github. It looked like this (scrubbed API keys).
```
# DOCKER-VERSION 1.11.1

FROM aaron8bit/hubot-c3po
MAINTAINER Aaron Albert, aalbert@pillartechnology.com

ENV HUBOT_PORT 8080
ENV HUBOT_ADAPTER slack
ENV HUBOT_NAME c3po
ENV HUBOT_GOOGLE_API_KEY <your google key>
ENV HUBOT_SLACK_TOKEN <your slack key>
ENV HUBOT_SLACK_TEAM <your team name>.slack.com
ENV HUBOT_SLACK_BOTNAME ${HUBOT_NAME}
ENV PORT ${HUBOT_PORT}

EXPOSE ${HUBOT_PORT}

WORKDIR /opt/bot

CMD bin/hubot
```

### Built it, run it
```
docker build -t="aaron8bit/hubot-c3po:live" .
docker run -d -p 45678:8080 aaronbit/hubot-c3po:live
```

### Invite the bot to a slack channel

### Some notes on where I found infomration (other than google)### Some notes on where I found infomration (other than google)### Some notes on where I found infomration (other than google)

Make a New Bot User
https://api.slack.com/bot-users
https://aaron8bit.slack.com/apps/new/A0F7YS25R-bots

Getting Started with Hubot
https://github.com/github/hubot/blob/7562e245eb5fe229fc861bfe870c6117ae36093f/docs/README.md

Dockerized Slack-integrated Hubot
http://nathanielhoag.com/blog/2014/12/07/a-dockerized-slack-integrated-hubot/

Google API Key
https://developers.google.com/maps/documentation/javascript/get-api-key

Google Image Search CSE
https://github.com/hubot-scripts/hubot-google-images#cse-setup-details

