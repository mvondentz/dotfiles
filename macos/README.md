### Apps to Install
- Alfred
- 1password
- Hidden Bar
- Chrome
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


### Brew
```
brew tap homebrew/cask-fonts
brew install --cask iterm2 karabiner-elements font-hack-nerd-font
brew install fish git go node pyenv neovim ripgrep fd fisher direnv exa gpg aspell mongodb/brew/libmongocrypt pkg-config numpy
```

### NPM
```
npm install -g neovim
```

### PY
```
pyenv install 3.9.2
```

### Fish
```
fisher install jethrokuan/z
```

### PIP
```
pip3 install pynvim
```

defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 1

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
