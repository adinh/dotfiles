#!/bin/bash
cd "$(dirname "$0")"
git pull
function doIt() {
  rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" --exclude "README.md" -av . ~
  VUNDLE_DIR="~/.vim/bundle/vundle"
  if [ ! -d "$VUNDLE_DIR" ]; then
    echo 'duddee'
    git clone https://github.com/gmarik/vundle.git $VUNDLE_DIR
  fi
  vim +BundleInstall +qall
}
if [ "$1" == "--force" -o "$1" == "-f" ]; then
  doIt
else
  read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    doIt
  fi
fi
unset doIt
source ~/.bash_profile