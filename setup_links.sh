#!/bin/sh

SCRIPT=`realpath $0`
SCRIPTPATH=`dirname $SCRIPT`
DOT_FILES=".gitconfig .gitignore_global .tmux.conf .vimrc .zshrc .irbrc"


for f in $DOT_FILES
do
	target="$HOME/$f"
	source="$SCRIPTPATH/$f"
	
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
