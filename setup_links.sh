#!/bin/sh

if [ "$PWD" = "$HOME" ]; then
	echo "Error: Needs to be executed in dotfiles directory"
	exit 1
fi

for f in ".gitconfig" ".gitignore" ".tmux.conf" ".vimrc" ".zshrc"
do
	if [ ! -f "$PWD/$f" ]; then
		echo "Error: Needs to be executed in dotfiles directory!"
		exit 1
	fi
done

for f in ".gitconfig" ".gitignore" ".tmux.conf" ".vimrc" ".zshrc"
do
	target="$HOME/$f"
	source="$PWD/$f"
	
	if [ -L "$target" ]; then
		rm $target
	fi	

	if [ -f "$target" ]; then
		mv $target "${target}.old"
	fi

	ln -s $source $target
  if [ $? -eq 0 ]; then
    echo "Created: $target"
  fi
done
