set fish_greeting "Remember to breathe"

set -gx TERM xterm-256color

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# aliases
alias ls "ls -p -G"
alias la "ls -A"
alias ll "exa -la -g --icons"
alias lla "ll -a"
alias e exit
alias q exit

alias v nvim
alias c clear
alias clera clear

#alias fd "fd … -X bat"

# Git Alias
alias g git
alias gs "g status"
alias gd "g diff"
alias gp "g push"
alias gl "g log --oneline"
alias gc "g checkout"
alias gp "g push"
alias ga "g commit --amend --no-edit"
alias gtree "g diff-tree --no-commit-id --name-only -r"

command -qv nvim && alias vim nvim

function batdiff
    git diff --name-only --relative --diff-filter=d | xargs bat --diff
end

set -gx EDITOR nvim

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH /usr/local/bin $PATH
set -gx PATH ~/.local/bin $PATH
set -gx PATH /opt/homebrew/bin $PATH

# NodeJS
set -gx PATH node_modules/.bin $PATH

# Go
set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH

# NVM
function __check_rvm --on-variable PWD --description 'Do nvm stuff'
  status --is-command-substitution; and return

  if test -f .nvmrc; and test -r .nvmrc;
    nvm use
  else
  end
end

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
  source $LOCAL_CONFIG
end


#pyenv init - | source

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/mvondentz/Downloads/google-cloud-sdk/path.fish.inc' ]; . '/Users/mvondentz/Downloads/google-cloud-sdk/path.fish.inc'; end
