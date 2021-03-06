ZSH_DISABLE_COMPFIX=true
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export PATH="$HOME/.npm-global/bin:$PATH"
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
ZSH_THEME="bira"
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$HOME/dotfiles/my-zsh

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  bazel
  bower
  bundler
  docker
  docker-compose
  fabric
  fzf
  git
  git-extras
  git-kraken
  gitx
  grunt
  highlight
  history-substring-search
  karma
  my-perl
  my-react
  my-yarn
  nvm
  nvmrc
  pip
  postgres
  pyenv
  ripgrep
  rust
  rvm
  urltools
  vagrant
  vi-mode
  yarn
  zsh-autosuggestions
)

# User configuration

test -d $HOME/bin && export PATH="$PATH:$HOME/bin"
test -d $HOME/.local/bin && export PATH="$PATH:$HOME/.local/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

test -d $HOME/.cargo && source $HOME/.cargo/env && export PATH="$HOME/.cargo/bin:$PATH"

# You may need to manually set your language environment
export LANG=is_IS.UTF-8
export LC_CTYPE=is_IS.UTF-8

export EDITOR='nvim'

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias gs=gss
alias npm-exec='PATH=$(npm bin):$PATH'

function gdwide() {
  git difftool --no-prompt --extcmd="colordiff -ydw"  $1| less
}

# No delay
export KEYTIMEOUT=1

# [[ -s "$($HOME)/.gvm/scripts/gvm" ]] && source "$($HOME)/.gvm/scripts/gvm"

export LUCINITY_UPDATE_RC=false

export LDFLAGS="-L/usr/local/opt/zlib/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include"
# eval "$(pyenv init -)"
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="/usr/local/opt/ruby/bin:$PATH"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export JAVA_HOME=/usr/local/opt/openjdk

source $HOME/.my_fzf
source $HOME/.zsh_my_aliases

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/gunnarsi/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/gunnarsi/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/gunnarsi/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/gunnarsi/google-cloud-sdk/completion.zsh.inc'; fi
export PATH="/usr/local/opt/libpq/bin:$PATH"

jdk() {
        version=$1
        export JAVA_HOME=$(/usr/libexec/java_home -v"$version");
        java -version
 }

alias postgres="/Users/gunnarsi/postgres.sh"
load_dotenv() {
	if [ -f .env ]
	then
  		export $(cat .env | sed 's/#.*//g' | xargs)
	fi
}
alias lenv=load_dotenv

clean_pip() {
  pip freeze | sed -r 's/^-e.*egg=([^&]*).*/\1/' | xargs pip uninstall -y
}

eval "$(zoxide init zsh)"
