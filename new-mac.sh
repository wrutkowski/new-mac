#!/bin/bash

# Install Command Lines Developer Tools
xcode-select --install
read -p "Agree to Command Line Developer Tools Prompt and follow installation instructions. Press enter to continue."

####### Homebrew & Ruby #######
# Install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Installing standalone ruby version
brew install ruby

# Install zsh, Oh My Zsh and switch to it
brew install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Switching to the new ruby version
echo 'export PATH="/usr/local/opt/ruby/bin:$PATH"' >> ~/.zshrc
echo 'export GEM_HOME=~/.gem' >> ~/.zshrc
echo 'export GEM_PATH=~/.gem' >> ~/.zshrc
echo 'export PATH=$PATH:$HOME/.gem/bin' >> ~/.zshrc
sed -i '' 's/^plugins.*/plugins=(git sudo compleat)/' ~/.zshrc
sed -i '' 's/^ZSH_THEME.*/ZSH_THEME="gallois"/' ~/.zshrc

####### System Preferences #######
# Dock
defaults write com.apple.dock orientation -string left
defaults write com.apple.dock "show-recents" -int 0
defaults write com.apple.dock tilesize -int 37
defaults write com.apple.dock largesize -int 49
defaults write com.apple.dock autohide -int 1
defaults write com.apple.dock magnification -int 1
defaults write com.apple.dock "minimize-to-application" -int 1
# Hot Corners
defaults write com.apple.dock "wvous-br-corner" -int 4 # Show Desktop
defaults write com.apple.dock "wvous-br-modifier" -int 0
defaults write com.apple.dock "wvous-tr-corner" -int 10 # Lock Screen
defaults write com.apple.dock "wvous-tr-modifier" -int 0
# Finder
defaults write com.apple.finder AppleShowAllFiles -string YES
defaults write com.apple.finder ShowStatusBar -int 1
defaults write com.apple.finder ShowPathbar -int 1
defaults write com.apple.finder SidebarTagsSctionDisclosedState -int 0
defaults write com.apple.finder SidebarPlacesSectionDisclosedState -int 1
defaults write com.apple.finder SidebarDevicesSectionDisclosedState -int 0
# Other
defaults write ~/Library/Preferences/.GlobalPreferences.plist "com.apple.trackpad.forceClick" -int 1
defaults write ~/Library/Preferences/.GlobalPreferences.plist "com.apple.trackpad.forceClick" -int 1
defaults write ~/Library/Preferences/.GlobalPreferences.plist "WebAutomaticSpellingCorrectionEnabled" -int 0
defaults write ~/Library/Preferences/.GlobalPreferences.plist "AppleActionOnDoubleClick" -string "Maximize"
defaults write ~/Library/Preferences/.GlobalPreferences.plist "AppleInterfaceStyle" -string "Dark"
defaults write ~/Library/Preferences/.GlobalPreferences.plist "CGDisableCursorLocationMagnification" -int 1
defaults write ~/Library/Preferences/.GlobalPreferences.plist "NSAutomaticCapitalizationEnabled" -int 0
defaults write ~/Library/Preferences/.GlobalPreferences.plist "NSAutomaticDashSubstitutionEnabled" -int 0
defaults write ~/Library/Preferences/.GlobalPreferences.plist "NSAutomaticPeriodSubstitutionEnabled" -int 0
defaults write ~/Library/Preferences/.GlobalPreferences.plist "NSAutomaticQuoteSubstitutionEnabled" -int 0
defaults write ~/Library/Preferences/.GlobalPreferences.plist "NSAutomaticSpellingCorrectionEnabled" -int 0
# Battery
defaults write com.apple.menuextra.battery ShowPercent YES
# Clock
defaults write com.apple.menuextra.clock DateFormat -string "EEE d MMM  HH:mm:ss"
defaults write com.apple.menuextra.clock FlashDateSeparators int 0
defaults write com.apple.menuextra.clock IsAnalog -int 0
# Three finger drag
defaults write ~/Library/Preferences/com.apple.driver.AppleBluetoothMultitouch.trackpad.plist "TrackpadThreeFingerDrag" -int 1 
defaults write ~/Library/Preferences/com.apple.AppleMultitouchTrackpad.plist "TrackpadThreeFingerDrag" -int 1
defaults write ~/Library/Preferences/com.apple.driver.AppleBluetoothMultitouch.trackpad.plist "TrackpadThreeFingerHorizSwipeGesture" -int 0
defaults write ~/Library/Preferences/com.apple.AppleMultitouchTrackpad.plist "TrackpadThreeFingerHorizSwipeGesture" -int 0
defaults write ~/Library/Preferences/com.apple.driver.AppleBluetoothMultitouch.trackpad.plist "Clicking" -int 1 
defaults write ~/Library/Preferences/com.apple.AppleMultitouchTrackpad.plist "Clicking" -int 1

# Desktop
curl -o ~/.desktop.jpg https://raw.githubusercontent.com/wrutkowski/new-mac/master/desktop.jpg
sqlite3 ~/Library/Application\ Support/Dock/desktoppicture.db "update data set value = '~/.desktop.jpg'";
killall Dock
killall Finder

# Safari
open /Applications/Safari.app
echo "Open Safari Preferences"
echo "- General -> Safari opens with: All windows from last session"
echo "- General -> Open \"safe\" files after downloading: uncheck"
echo "- Advanced -> Show full website address: check"
echo "- Advanced -> Show Develop menu in menu bar: check"
read -p "Press enter to continue"


####### Additional Software #######
# Quick Look
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlimagesize webpquicklook suspicious-package quicklookase qlvideo
# VSCode
brew cask install visual-studio-code
# Clipy - clipboard management
brew cask install clipy
open /Applications/Clipy.app
echo "Change Clipy settings"
echo "- General -> Max history size: 100 items"
echo "- Menu -> Number of chars in the menu: 200 chars"
# Sourcetree
brew cask install sourcetree

# App Store software
open "macappstore://itunes.apple.com/app/id441258766?mt=12" # Magnet 
read -p "Install Magnet manually from App Store and press enter to continue"

open "macappstore://itunes.apple.com/app/id1388020431?mt=12" # DevCleaner 
read -p "Install DevCleaner manually from App Store and press enter to continue"


####### Xcode #######
# Installing xcode-install
gem install xcode-install --no-document
echo "What version of Xcode you want to install? "
read xcodeVersion
xcversion install $xcodeVersion


echo "All done, cheers 🙌"