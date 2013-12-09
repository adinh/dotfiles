#!/usr/bin/env bash
cd "$(dirname "$0")"
git pull origin master

function syncHome() {
  rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" --exclude "README.md" -av --no-perms . ~
  source ~/.bash_profile
}

function vundleMe() {
  VUNDLE_DIR="$HOME/.vim/bundle/vundle"
  if [ ! -d "$VUNDLE_DIR" ]; then
    git clone https://github.com/gmarik/vundle.git $VUNDLE_DIR
  fi
  vim +BundleInstall +qall
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  syncHome
  vundleMe
else
  read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    syncHome
    vundleMe
  fi
fi
unset syncHome vundleMe