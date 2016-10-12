# Aaron's Notes on Making This

Getting Started with Hubot
https://github.com/github/hubot/blob/7562e245eb5fe229fc861bfe870c6117ae36093f/docs/README.md

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

### Built it, run it
```
docker build -t="aaron8bit/hubot-c3po:live" .
docker run -d -p 45678:8080 aaronbit/hubot-c3po:live
```

### Invite the bot to a slack channel


