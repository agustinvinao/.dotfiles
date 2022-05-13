# tmux plugins

## installation

```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
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
|------|---------------------------------------|

# apt install packages
```
sudo apt install \
  software-properties-common \
	tmux \
	neovim \
	podman \
	git \
	exa \
	bat \
	mosh \
	zsh \
  python3-pip

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

