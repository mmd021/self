# Installation

```sh
# Let's install the bot.
sudo apt-get update

sudo apt-get upgrade

sudo apt-get install libreadline-dev libconfig-dev libssl-dev lua5.2 liblua5.2-dev libevent-dev make unzip git redis-server g++ libjansson-dev libpython-dev expat libexpat1-dev tmux subversion
cd $HOME
git clone https://github.com/mmd021/self.git
cd self
chmod +x self.sh
./self.sh install
cd .luarocks/bin
./luarocks-5.2 install luafilesystem
./luarocks-5.2 install lub
./luarocks-5.2 install luaexpat
./luarocks-5.2 install serpent
./luarocks-5.2 install feedparser
./luarocks-5.2 install redis-lua
./luarocks-5.2 install fakeredis
cd ../..
./self.sh 
# Enter a phone number & confirmation code.
```
### One command
To install everything in one command, use:
```sh
cd $HOME
cd self
./self.sh
```
# Developer!

[MOHAMA:D]([Telegram](https://telegram.me/tel_d))