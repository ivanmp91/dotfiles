#!/usr/bin/env zsh

FILES=".zshrc
.vimrc
.antigenrc"
GIT_PROJECT="projects/github/dotfiles"

for i in `echo $FILES` ; do
  cp ${HOME}/${i} ${HOME}/${GIT_PROJECT}/
done
