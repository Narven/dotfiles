# Installation

> This is a general description of crap that I need to install

* Basic packages:
```bash
sudo apt-get install curl python-software-properties
```

* Install NodeJS via Snap
```sh
snap install --edge node --classic
```

* Get my dotfiles
```sh
git clone git@github.com:Narven/dotfiles.git
```

* Get and install my favorite ZSH Theme
```sh
git clone https://github.com/ergenekonyigit/lambda-gitster.git
cd lamda-gister
cp lambda-gitster.zsh-theme ~/.oh-my-zsh/custom/themes
```

* Install Docker and docker-compose and set permissions to execute to my current user
```sh
sudo apt-get install docker.io
sudo usermod -aG docker $USER
sudo apt-get install docker-compose
```

* Install Temperature control for linux
```sh
sudo add-apt-repository ppa:linrunner/tlp
sudo apt-get update
sudo apt-get install tlp tlp-rdw
sudo apt-get clean
sudo tlp start
```

* Install app specific for laptops running Linux
```sh
sudo add-apt-repository ppa:ubuntuhandbook1/apps
sudo apt-get update
sudo apt-get install laptop-mode-tools
```

* Remove Ghostscript (annoys me, because it conflicts with my `gs` alias command
```sh
sudo apt-get remove ghostscript
```

* Install TMUX
```sh
sudo apt install tmux
```

* Change the default background image on the Linux Login screens
```sh
sudo mkdir /usr/share/backgrounds/custom/
~/Pictures/cfef2749daad1d46f8a2848d0c42f3d6.jpg /usr/share/backgrounds/custom
sudo cp ~/Pictures/cfef2749daad1d46f8a2848d0c42f3d6.jpg /usr/share/backgrounds/custom
vim /usr/share/mdm/html-themes/Mint-X/slideshow.conf
```

* LSD is an `ls` command on steroids
```sh
snap install lsd
```

* Install Typescript and Yarn in global NPM
```sh
npm i typescript yarn -g
```

* Add this to the source.list to have the latest Erlang packages
```sh
deb https://packages.erlang-solutions.com/ubuntu trusty contrib
deb https://packages.erlang-solutions.com/ubuntu saucy contrib
deb https://packages.erlang-solutions.com/ubuntu precise contrib

wget https://packages.erlang-solutions.com/ubuntu/erlang_solutions.asc
sudo apt-key add erlang_solutions.asc

sudo apt-get update
sudo apt-get install erlang
```

* Install Mix packages and Phoenix Framework (cached version)
```sh
mix local.hex
mix archive.install https://github.com/phoenixframework/archives/raw/master/phx_new.ez
```

* Sometimes we need better desktop notifications
```sh
sudo apt-get install inotify-tools
```

* Install favorite Terminal on Linux
```sh
sudo apt-get install terminator
```

* Install fonts
```sh
wget https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.zip
unzip Hack-v3.003-ttf.zip
sudo cp -a ./ttf /usr/share/fonts
fc-cache -f -v
fc-list | grep "Hack" # just to check that is installed
```

* Other stuff to install

1. Spotify
2. Steam
3. Telegram
4. Whatsapp
