### Apps to Install
- Alfred
- 1password
- Hidden Bar
- Bravo
- Homebrew
- HackerFonts (https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Hack)
- pip (curl https://bootstrap.pypa.io/get-pip.py | python3)
- vim-plug (sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
- gcloud
- zoom
- spotify
- logitech g hub
- steelseries gg
- Memory


### Brew
```
brew tap homebrew/cask-fonts
brew install --cask iterm2 karabiner-elements font-hack-nerd-font docker
brew install fish git go node pyenv neovim ripgrep fd fisher direnv exa gpg aspell mongodb/brew/libmongocrypt pkg-config numpy tmux jq mongocli mongodb-community
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

### TMUX
```
# tmux-plugin
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Themes
git clone https://github.com/jimeh/tmux-themepack.git ~/.tmux-themepack
```


### Karabiner Keymaps
~/.config/karabiner/assets/complex_modifications/

```
{
  "title": "Change caps_lock to Esc and Control",
  "rules": [
	{
	  "description": "Post Esc if Caps is tapped, Control if held.",
	  "manipulators": [
        {
            "type": "basic",
            "from": {
                "key_code": "left_control",
                "modifiers": {
                    "optional": [
                        "any"
                    ]
                }
            },
            "to": [
                {
                    "key_code": "left_control",
                    "lazy": true
                }
            ],
            "to_if_alone": [
                {
                    "key_code": "escape"
                }
            ]
        }
	  ]
	}
  ]
}
```
