### Apps to Install
- Alfred
- 1password
- Hidden Bar
- Homebrew
- HackerFonts (https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Hack)
- Incosolata (https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Inconsolata/complete/Inconsolata%20Regular%20Nerd%20Font%20Complete.ttf)
- pip (curl https://bootstrap.pypa.io/get-pip.py | python3)
- gcloud
- zoom
- spotify
- logitech g hub
- steelseries gg
- Google drive
- Fantastical
- Notion
- Todoist


### Brew
```
brew tap homebrew/cask-fonts
brew install --cask iterm2 karabiner-elements font-hack-nerd-font docker amethyst 
brew install fish git go node pyenv neovim ripgrep fd fisher direnv exa gpg aspell mongodb/brew/libmongocrypt pkg-config numpy tmux jq mongocli mongodb-community bat pinentry-mac docker
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
defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 1
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

# Themes
git clone https://github.com/jimeh/tmux-themepack.git ~/.tmux-themepack (OLD)

ln -s ~/code/github.com/MauricioDentz/dotfiles/macos/.config/colors/falcon.tmux.conf ~/.tmux/falcon.tmux.conf
```

### Karabiner Keymaps
~/.config/karabiner/assets/complex_modifications/
ln -s ~/code/github.com/MauricioDentz/dotfiles/macos/.config/karabiner ~/.config/karabiner
```
