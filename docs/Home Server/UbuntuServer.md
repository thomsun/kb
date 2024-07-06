# Ubuntu Server

## Install Ubuntu Server
This is based on Ubuntu Server 22.04.02

- Install `OpenSSH`
- Not installing additional component

## Update System
```sudo apt update && sudo apt upgrade```

## Set timezone
```sudo timedatectl set-timezone America/Los_Angeles```

## Install net-tools


## Install `oh-my-zsh` and plugin

- Install `oh-my-zsh`
    - Install `Powerlevel10k`
    - Install `zsh-syntax-highlighting`
    - Install `zsh-autosuggestions`

## ssh without password

Run the following on client `ssh-copy-id -i ~/.ssh/id_ed25519.pub thomsun@192.168.1.201`

## Homebrew

- Install `Homebrew`
    - Install `fzf`
    - Install `fasd`

## tmux

- Install `tmux` via `Homebrew`
    - Install TPM
    - Configure tmux.conf
- Add tmux plugin in oh-my-zsh

## docker

- Install and configure docker


