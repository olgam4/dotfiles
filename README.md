# dotfiles

<a href="http://www.wtfpl.net/"><img
       src="http://www.wtfpl.net/wp-content/uploads/2012/12/wtfpl-badge-4.png"
       width="80" height="15" alt="WTFPL" /></a>

## About this projet

Recently, I've had the hastle of following a long and tedious Notion setup tutorial.
Acquiring a new computer is all fun and games until you can't use those same tools you
had previously...

Hence: my dotfiles. This project aims to bootstrap your configuration through a single command.

## How to use

### Prerequesites

* Signin to AppStore

Simply run on macos

```bash
export GIT_AUTH_NAME="Olivier Gamache"
export GIT_AUTH_EMAIL="olivier.gamache@.elapsetech.com"
bash <(curl -s https://raw.githubusercontent.com/olgam4/dotfiles/master/macos/bootstrap.sh)
```

## Roadmap

- [x] Automate nvim configuration

- [x] Automate git configuration

- [ ] Allow git tokens to be passed with VARs

- [x] Automate iterm2 configuration

- [ ] Automate `xcode-select --install`

- [x] Automate homebrew installation

- [ ] Add mas

- [ ] Automate installation of FiraCode

- [ ] Automate BetterSnapTool with mas

- [ ] Automate node/npm installation

- [ ] Automate oh-my-zsh installation and setup

- [ ] Automate karabiner installation and setup

- [ ] Automate lua installation

- [x] Automate python installation

- [ ] Automate java installation

- [x] Find and automate terminal installation -> Now using iTerm2

- [ ] Add simple bin to add `dotfiles` commands

- [ ] Allow update
