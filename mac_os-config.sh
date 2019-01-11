#! /usr/bin/env bash

# Applies system and application defaults.

printf "System - Disable the 'Are you sure you want to open this application?' dialog\n"
defaults write com.apple.LaunchServices LSQuarantine -bool false

printf "Keyboard - Enable keyboard access for all controls\n"
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# printf "Keyboard - Set a fast keyboard repeat rate\n"
# defaults write NSGlobalDomain KeyRepeat -int 0

# printf "Keyboard - Disable press-and-hold for keys in favor of key repeat\n"
# defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

printf "Dock - Remove all default app icons\n"
defaults write com.apple.dock persistent-apps -array && killall Dock

printf "Dock - Automatically hide and show\n"
defaults write com.apple.dock autohide -bool true

printf "Dock - Remove the auto-hiding delay\n"
defaults write com.apple.Dock autohide-delay -float 0

printf "Dock - Don’t show Dashboard as a Space\n"
defaults write com.apple.dock "dashboard-in-overlay" -bool true

printf "Finder - Use list view in all Finder windows\n"
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

printf "Safari - Set home page to 'about:blank' for faster loading\n"
defaults write com.apple.Safari HomePage -string "about:blank"

printf "Game Center - Disable Game Center\n"
defaults write com.apple.gamed Disabled -bool true

printf "Keyboard - Remap caps-lock to control\n"
hidutil property --set '{"UserKeyMapping":
[{
  "HIDKeyboardModifierMappingSrc":0x700000039,
  "HIDKeyboardModifierMappingDst":0x7000000E0
  }]
}'
"To Key Remapping state: "
"hidutil property --get "UserKeyMapping""
"(null) if nothing chnaged"
"more info:"
"https://developer.apple.com/library/archive/technotes/tn2450/_index.html"
