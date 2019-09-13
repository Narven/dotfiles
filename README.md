# Installation

> This is a general description of crap that I need to install

* Basic packages:
```bash
sudo apt-get install curl python-software-properties build-essential tree
```

* Install NodeJS via Snap
```sh
snap install --edge node --classic
```

* Install OH MY ZSH
```sh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
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

* Install Typescript, Yarn, n, neovim in global NPM
```sh
npm i typescript yarn n neovim -g
```
* Install latest Node
```sh
n latest
sudo snap remove node
vim ~/.zshrc
# add the path of the n installation bin
```


* Add this to the source.list to have the latest Erlang packages
```sh
deb https://packages.erlang-solutions.com/ubuntu trusty contrib
deb https://packages.erlang-solutions.com/ubuntu saucy contrib
deb https://packages.erlang-solutions.com/ubuntu precise contrib

wget https://packages.erlang-solutions.com/ubuntu/erlang_solutions.asc
sudo apt-key add erlang_solutions.asc

sudo apt-get update
sudo apt-get install erlang erlang-dev
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

* Install Go (golang.org)
```sh
cd ~/Downloads
wget https://dl.google.com/go/go1.12.7.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.12.7.linux-amd64.tar.gz
# Add `/usr/local/go/bin` to $PATH
go version # to confirm
```

* Install Ranger
```sh
sudo apt-get install ranger
```

* Generate RSA Keys if needed
```sh
ssh-keygen -t rsa
```

* Install NEOVIM
```sh
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim
sudo apt-get install python-dev python-pip python3-dev python3-pip
```

** Install NEOVIM dependencies
```sh
sudo apt-get install python-neovim python-setuptools

```

** Update All Plugins
Inside NEOVIM run `PlugUpgrade` and `PlugInstall` or `PlugUpdate`

* Install Java
```sh
sudo apt-get install default-jre
sudo apt-get install default-jdk
```
* Install NoSQLBooster
```sh
cd ~/Downloads
wget https://nosqlbooster.com/s3/download/releasesv5/nosqlbooster4mongo-5.1.12.AppImage
sudo mv nosqlbooster4mongo-5.1.12.AppImage /usr/bin/nosqlbooster
```

* Install Terraform
```sh
cd ~/Downloads
wget https://releases.hashicorp.com/terraform/0.12.5/terraform_0.12.5_linux_amd64.zip
unzip terraform_0.12.5_linux_amd64.zip
sudo mv terraform /usr/local/bin
```

* Install PIP
```sh
sudo apt-get install python3-pip
cd ~/Downloads
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py --user
```

* Install Python NEOVIM
```sh
pip2 install --upgrade --force-reinstall neovim --user
```

* Install Ranger
```sh
sudo apt-get install ranger && ranger --copy-config=all
```
> Configuration will be available at ~/.config/ranger

* Install other stuff to install

1. Spotify
2. Steam
3. Telegram
4. Whatsapp


* Other base configurations (Mint)
1. G to Keyboard Preferences and Options and change configuration on the CAPS
   LOCK key to also be `Caps Lock is also a Ctrl`
snap install aws-cli --classic
sudo apt install xclip
sudo snap install simplenote
npm install -g firebase-tools
