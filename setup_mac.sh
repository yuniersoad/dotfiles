#!/usr/bin/env bash

 # fast key repeat rate, requires reboot to take effect
 defaults write ~/Library/Preferences/.GlobalPreferences KeyRepeat -int 1
 defaults write ~/Library/Preferences/.GlobalPreferences InitialKeyRepeat -int 15

 # vim in Intellj and other IDEs
 defaults write -g ApplePressAndHoldEnabled -bool false

 # mouse acceleration no thanks, requieres reboot
 defaults write .GlobalPreferences com.apple.mouse.scaling -1

 # set finder to display full path in title bar
 defaults write com.apple.finder '_FXShowPosixPathInTitle' -bool true
