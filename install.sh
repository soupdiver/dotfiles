#!/usr/bin/env zsh

# Load helper functions
source funcs.sh

DOTFILES_REPO_ROOT=$(pwd -P)
cd "$HOME"

FILES_TO_LINK=('.zshenv' '.zshrc')

main "Linking zsh files"

for f in $FILES_TO_LINK
do
  if [ ! -f "${f}" ]
  then 
    ln -s "${DOTFILES_REPO_ROOT}/${f}" "${f}"
  else
    sub "Skipping ${f} - already exists"
  fi
done
