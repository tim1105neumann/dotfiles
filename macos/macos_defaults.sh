# Finder settings
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder WarnOnEmptyTrash -bool false
defaults write com.apple.finder QuitMenuItem -bool true
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Dock
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock show-recents -bool false
defaults write com.apple.dock orientation -string "bottom"
# defaults write com.apple.dashboard mcx-disabled -bool true

# System / keyboard / mouse
defaults write -g com.apple.mouse.scaling -float 3
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool true
defaults write -g com.apple.trackpad.forceClick -bool true
defaults write -g com.apple.trackpad.scaling -float 2.5
defaults write -g com.apple.springing.enabled -bool true
defaults write -g com.apple.springing.delay -float 0.5
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool false
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool false

# Menu bar
defaults write com.apple.menuextra.clock dateformat -string "hh:mm"
defaults write NSGlobalDomain AppleEnableMenuBarTransparency -bool false

defaults write NSGlobalDomain com.apple.sound.beep.flash -bool false

killall Finder
killall Dock
killall SystemUIServer
