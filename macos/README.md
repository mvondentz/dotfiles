```
- HackerFonts (https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Hack)
- Incosolata (https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Inconsolata/complete/Inconsolata%20Regular%20Nerd%20Font%20Complete.ttf)
- pip (curl https://bootstrap.pypa.io/get-pip.py | python3)
```

### Brew
```
brew tap homebrew/cask-fonts
brew install --cask iterm2 karabiner-elements font-hack-nerd-font docker amethyst 
brew install fish git go node pyenv neovim ripgrep fd fisher direnv exa gpg aspell mongodb/brew/libmongocrypt pkg-config numpy tmux jq mongocli mongodb-community bat pinentry-mac docker git-delta
```

### Macos
```
defaults write com.apple.dock autohide-delay -float 0; defaults write com.apple.dock autohide-time-modifier -int 0;killall Dock
```

### NPM
```
npm install -g neovim
```

### GO
```
go install github.com/deepmap/oapi-codegen/cmd/oapi-codegen@latest
```

### PY
```
pyenv install 3.9.2
```

### Fish
```
fisher install jethrokuan/z

fish_add_path /opt/homebrew/bin
echo "/opt/homebrew/bin/fish" | sudo tee -a /etc/shells
chsh -s /opt/homebrew/bin/fish
```

### PIP
```
pip3 install pynvim
```

###  Keyrepeat
```
defaults write -g InitialKeyRepeat -int 13
defaults write NSGlobalDomain InitialKeyRepeat -int 13
defaults write -g KeyRepeat -int 1
defaults write -g NSGlobalDomain -int 1
defaults delete -g ApplePressAndHoldEnabled
```

### GPG
```
git config --global gpg.program gpg
git config --global commit.gpgsign true

which pinentry-mac
touch ~/.gnupg/gpg-agent.conf
pinentry-program <pinentry dir>

gpgconf --kill gpg-agent
echo "test" | gpg --clearsign
```

### TMUX
```
# tmux-plugin
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

#
ln -s ~/code/github.com/MauricioDentz/dotfiles/macos/.config/tmux ~/.config/tmux
```

### Karabiner Keymaps
```
~/.config/karabiner/assets/complex_modifications/
ln -s ~/code/github.com/MauricioDentz/dotfiles/macos/.config/karabiner ~/.config/karabiner
```
