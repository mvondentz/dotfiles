
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

export TERM='screen-256color'
export EDITOR='nvim'
export VISUAL='nvim'

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# ZSH_THEME="avit"
# ZSH_THEME="gallois"
# ZSH_THEME="sporty_256"
ZSH_THEME="zhann"
# ZSH_THEME="af-magic"
# ZSH_THEME="random"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true

ZSH_DISABLE_COMPFIX=true

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
#DISABLE_AUTO_UPDATE="false"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
 HIST_STAMPS="dd.mm.yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git themes colorize fzf)

# User configuration
source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
else
  export EDITOR='vim'
fi

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

export BINPATH="/bin/"
export BINPATH="$BINPATH:~/bin/"
export BINPATH="$BINPATH:/usr/local/bin/"
export BINPATH="$BINPATH:~/.local/bin"
export BINPATH="$BINPATH:/opt/homebrew/bin"
export PATH="$PATH:$BINPATH"

export GOPATH="/Users/mvondentz/go/"
export PATH="$PATH:$GOPATH/bin"
export GOROOT="/usr/local/go"
export PATH="$PATH:$GOROOT/bin"
#
export GOPROXY=direct

# export GOPATH="${HOME}/workspace"
# export GOROOT="${HOME}/go"
#
# export GOPATH="${HOME}/workspace"
# export PATH="$GOPATH/bin:$PATH"
# export GOROOT="/usr/local/go"
# export PATH="$GOROOT/bin:$PATH"

export TERMINFO=/usr/share/terminfo
##-------------------
## Personal Aliases
##-------------------

alias psa='ps aux | grep'
alias rm='rm -i'
alias cp='cp -i'
alias cpf='cp'
alias mv='mv -i'
## -> Prevents accidentally clobbering files.
alias mkdir='mkdir -p'
#
alias h='history'
alias j='jobs -l'
alias which='type -a'
alias ..='cd ..'
alias cd..='cd ..'

# Pretty-print of some PATH variables:
alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'
alias du='du -kh'    # Makes a more readable output.
alias df='df -kTh'

# Add colors for filetype and  human-readable sizes by default on 'ls':
alias ls='ls -hA --color'
alias lx='ls -lXB'         #  Sort by extension.
alias lk='ls -lSr'         #  Sort by size, biggest last.
alias lt='ls -ltr'         #  Sort by date, most recent last.
alias lc='ls -ltcr'        #  Sort by/show change time,most recent last.
alias lu='ls -ltur'        #  Sort by/show access time,most recent last.
# The ubiquitous 'll': directories first, with alphanumeric sorting:
alias ll="ls -lvA"
alias lm='ll |more'        #  Pipe through 'more'
alias lr='ll -R'           #  Recursive ls.
alias la='ll -A'           #  Show hidden files.
alias tree='tree -Csuh'    #  Nice alternative to 'recursive ls' ...
alias kill='kill -9'

# -----------------------------------------------------------
alias services='cd ~/code/github.com/EverlongProject/services.git/ && v .'
alias nvimconf='cd ~/.config/nvim/ && v .'
# -----------------------------------------------------------

alias xs='cd'
alias vf='cd'
alias moer='more'
alias moew='more'
alias kk='ll'
alias vin='vim'

alias e=exit
alias q=exit

alias v=nvim
alias v.=nvim .
alias vim=nvim
alias c=clear
alias clera=clear

# ---- GIT
alias g=git
alias gs="g status"
alias gd="g diff"
alias gp="g push"
alias gpf="g push --force"
alias gl="g log --oneline"
alias gc="g checkout"
alias ga="g commit --amend --no-edit"
alias gtree="g diff-tree --no-commit-id --name-only -r"
alias gwadd="git_add_worktree"
alias gundoammend="git reset --soft HEAD@{1}"
alias grestore="git restore -s main"
alias gapf="g add . && ga && gpf"

git_add_worktree (){
    g worktree add -b mvondentz/$1 $1
}

function git-delete-squashed {
  local mainline=${1:-main}
  git checkout -q $mainline || return
  git for-each-ref refs/heads/ --format='%(refname:short)' | while read -r branch; do
    local mergeBase=$(git merge-base $mainline $branch)
    if [[ $(git cherry $mainline $(git commit-tree $(git rev-parse $branch\^{tree}) -p $mergeBase -m _)) == "-"* ]]; then
      git branch -D $branch
    fi
  done
}


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/mvondentz/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/mvondentz/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/mvondentz/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/mvondentz/google-cloud-sdk/completion.zsh.inc'; fi
