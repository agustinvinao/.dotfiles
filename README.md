# tmux plugins

## installation

```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
Installing plugins (required the first time):
1. Add new plugin to ~/.tmux.conf with `set -g @plugin '...'`
2. Press prefix + I (capital i, as in Install) to fetch the plugin

# vim

## install plugins manager (https://github.com/junegunn/vim-plug)

```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

# packages

|------|-------------|
| name | description |
|------|------------------------------------------------------|
| bat | Bacula Administration Tool Console |
| exa | modern replacement for the command-line program ls that ships with Unix and Linux operating systems | 
| git | distributed version control system |
| kubectl | kubectl controls the Kubernetes cluster manager |
| mosh | roaming, supports intermittent connectivity, and provides intelligent local echo and line editing of user keystrokes |
| nvim | hyperextensible Vim-based text editor |
| lazygit | A simple terminal UI for git commands |
| podman | Podman is a tool for running Linux containers |
| python3-pip | python pip tool |
| python3-venv | environments for python |
| starship | The minimal, blazing-fast, and infinitely customizable prompt for any shell! |
| tmux | terminal multiplexer for Unix-like operating systems |
| zsh | roaming, supports intermittent connectivity, and provides intelligent local echo and line editing of user keystrokes |
| exuberant-ctags | Generate tag files for source code
| nodejs | node |
| yarn | node package manager |
|------|---------------------------------------|

# apt install packages
```
sudo apt install \
	bat \
	podman \
	git \
	exa \
  exuberant-ctags \
	mosh \
	neovim \
  nodejs \
  python3-pip \
  nodejs \
  npm \
  software-properties-common \
	tmux \
	zsh

sudo apt install --yes -- python3-venv

sudo apt install ppa-purge

sudo add-apt-repository ppa:lazygit-team/release
sudo apt-get update
sudo apt-get install lazygit
```

### starship install instructions
```

```

### exa settings and others

aliases

```
alias ls="exa"
alias ll="exa -alh"
alias tree="exa --tree"
```

### kubectl

1. Update the apt package index and install packages needed to use the Kubernetes apt repository:

```
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl
```

2. Download the Google Cloud public signing key:

```
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
```

3. Add the Kubernetes apt repository:

```
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
```

4. Update apt package index with the new repository and install kubectl:

```
sudo apt-get update
sudo apt-get install -y kubectl
```

### using zsh

```
chsh -s /usr/bin/zsh
```

### kubectl autocomplete on zsh

run:
```
autoload -Uz compinstall && compinstall
```

add to .zshrc
```
source <(kubectl completion zsh)
```

### starship

This it doesn't have a package, needs to use the linux install:

```
curl -sS https://starship.rs/install.sh | sh
```


### lazygit

#### install dependencies: go

```
wget https://dl.google.com/go/go1.xx.x.linux-xxxxx.tar.gz
mv go /usr/local
```

add go to path:
```
export GOPATH=/usr/local/go
```

#### clone and install

```
git clone https://github.com/jesseduffield/lazygit.git
cd lazygit
go install
```

#### nodejs 18.x

```
curl -sL https://deb.nodesource.com/setup_16.x | sudo bash -
```

#### yarn

```
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | sudo tee /usr/share/keyrings/yarnkey.gpg >/dev/null                                    
echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | sudo tee /etc/apt/sources.list.d/yarn.list              
sudo apt-get update && sudo apt-get install yarn

## Run `sudo apt-get install -y nodejs` to install Node.js 16.x and npm
## You may also need development tools to build native addons:
     sudo apt-get install gcc g++ make
## To install the Yarn package manager, run:
     curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | sudo tee /usr/share/keyrings/yarnkey.gpg >/dev/null
     echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
     sudo apt-get update && sudo apt-get install yarn

```

##### add yarn to the path

```
export PATH="$PATH:/opt/yarn-[version]/bin"
```

### vim - coc

#### get vim-plug home folder

```vim
let plug_home

```

#### install dependencies

```bash
cd vim-plug home
cd coc.vim
yarn install
yarn build
```

#### language autocomplete moduels

##### pyton

```vim
:CocInstall coc-python
```

```bash
sudo apt install python3-pip
pip3 install jedi
```

##### bash

```vim
:CoCInstall coc-sh
```

##### html 

```vim
:CoCInstall coc-html
```

##### javascript/typescript 

```vim
:CoCInstall coc-tsserver
```

##### json 

```vim
:CoCInstall coc-json
```

##### markdown

```vim
:CoCInstall coc-markdownlint
```

##### ruby

```vim
:CoCInstall coc-solargraph
```

##### solidity

```vim
:CoCinstall solidiy
```

##### css

```vim
:CoCInstall coc-css
```

##### dockerfile
```vim
"languageserver": {
  "dockerfile": {
    "command": "docker-langserver",
    "filetypes": ["dockerfile"],
    "args": ["--stdio"]
  }
}
```

##### markmap

```vim
:CoCInstall markmap
``` 

