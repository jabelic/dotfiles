eval "$(/opt/homebrew/bin/brew shellenv)"

promptinit
zstyle ':prompt:pure:git:*' color cyan
zstyle :prompt:pure:path color white
autoload -Uz promptinit

# optionally define some options
PURE_CMD_MAX_EXEC_TIME=10

# change the path color
zstyle :prompt:pure:path color white

# change the color for both `prompt:success` and `prompt:error`
zstyle ':prompt:pure:prompt:*' color cyan

# turn on git stash status
zstyle :prompt:pure:git:stash show yes

prompt fire


# z command
. ~/z/z.sh

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

# https://qiita.com/tamachan210/items/b253ced93425d7cc0f1f
if [ "$(uname -m)" = "arm64" ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
  export PATH="/opt/homebrew/bin:$PATH"
else
  eval "$(/usr/local/bin/brew shellenv)"
fi

if [ "$(uname -m)" = "arm64" ]; then
  # arm64
  export PYENV_ROOT="$HOME/.pyenv_arm64"
  export PATH="$HOME/.pyenv_arm64/bin:$PATH"
  eval "$(pyenv init -)"
else
  # x86_64
  export PYENV_ROOT="$HOME/.pyenv_x64"
  export PATH="$HOME/.pyenv_x64/bin:$PATH"
  eval "$(pyenv init -)"
fi

# Rosetta Arm 切り替え
alias x86='arch -x86_64 zsh'
alias arm='arch -arm64e zsh'


# Julia 
if [ "$(uname -m)" = "arm64" ]; then
  alias julia=/Applications/Julia-1.8-arm.app/Contents/Resources/julia/bin/julia
else
  alias julia=/Applications/Julia-1.8-intel.app/Contents/Resources/julia/bin/julia
fi


# git
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{magenta}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{yellow}+"
zstyle ':vcs_info:*' formats "%F{cyan}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }

# プロンプトカスタマイズ
# PROMPT='
# [%B%F{red}%n@%m%f%b:%F{green}%~%f]%F{cyan}$vcs_info_msg_0_%f
# %F{yellow}$%f '
PROMPT='
[%F{green}%~%f]%F{cyan}$vcs_info_msg_0_%f
%F{yellow}$%f '
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
. /Users/jabelic/dotfiles/dotfiles/.plugins.zsh
alias dsstore="find . -name '*.DS_Store' -type f -ls -delete"
. /Users/jabelic/dotfiles/dotfiles/.plugins.zsh
alias dsstore="find . -name '*.DS_Store' -type f -ls -delete"
. /Users/jabelic/dotfiles/dotfiles/.plugins.zsh
alias dsstore="find . -name '*.DS_Store' -type f -ls -delete"
export PATH="/usr/local/opt/curl/bin:/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
