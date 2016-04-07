# 環境設定
export PATH=$PATH:~/.gem/ruby/1.8/bin/:/Users/n_itou/pear/bin
export PATH="/Users/n_itou/.rbenv/versions/2.1.0/lib/ruby/gems/2.1.0/gems:$PATH"
export PATH="/usr/bin/rails:$PATH"
export PATH=/usr/local/bin:$PATH

alias ruby='/usr/local/Cellar/ruby/2.1.2_2/bin/ruby'

# 色
export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad

# 補完設定
autoload -U compinit; compinit

# sudo でも補完の対象
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin

# 補完時に大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# 補完候補が複数ある時に、一覧表示
setopt auto_list

# auto_list の補完候補一覧で、ls -F のようにファイルの種別をマーク表示
setopt list_types

# ディレクトリ名の補完時に / を付加
setopt auto_param_slash

# Ctrl+wで､直前の/までを削除する
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

compdef _man w3mman
compdef _tex platex

# プロンプトの設定
autoload -U colors; colors
PROMPT=$'\n%{\e[1;32m%}%n@%m %{\e[1;33m%}%~\n%{\e[1;m%}%(!.#.$) '
SPROMPT="correct: %R -> %r ? "

# history 関係の設定 
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=100000
setopt extended_history # history ファイルに時刻を追加
setopt share_history  # シェルのプロセスごとに履歴を共有
setopt append_history # 複数の zsh を同時に使う時など history ファイルに上書きせず追加

# コマンドが入力されるとすぐに追加
setopt inc_append_history

# 補完の利用設定
autoload -U compinit; compinit

# rvm 環境設定
if [[ -s ~/.rvm/scripts/rvm ]] ; then source ~/.rvm/scripts/rvm ; fi

# 言語設定
export LANG=ja_JP.UTF-8

# aliases
alias vim='env LANG=ja_JP.UTF-8 vim' 
alias ls='ls -FG'

alias rm='rm -i'
alias mv='mv -i'
alias l='ls -al'
alias ps='ps aux'
alias tree='find . -type f -print'
alias hist='vim ~/.zsh_history'
alias gd='git diff HEAD --color'

# git 関係の設定
autoload -Uz VCS_INFO_get_data_git; VCS_INFO_get_data_git 2> /dev/null

function rprompt-git-current-branch {
  local name st color gitdir action
  if [[ "$PWD" =~ '/\.git(/.*)?$' ]]; then
    return
  fi
  name=`git branch 2> /dev/null | grep '^\*' | cut -b 3-`
    if [[ -z $name ]]; then
      return
    fi
    gitdir=`git rev-parse --git-dir 2> /dev/null`
    action=`VCS_INFO_git_getaction "$gitdir"` && action="($action)"
    st=`git status 2> /dev/null`
    if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
      color=%F{green}
    elif [[ -n `echo "$st" | grep "^nothing added"` ]]; then
      color=%F{yellow}
    elif [[ -n `echo "$st" | grep "^# Untracked"` ]]; then
      color=%B%F{red}
    else
      color=%F{red}
    fi
    echo "$color$name$action%f%b "
}

# git 関係  プロンプトが表示されるたびにプロンプト文字列を評価、置換する
setopt prompt_subst
RPROMPT='[`rprompt-git-current-branch`%~]'

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

## 顔文字
setopt prompt_subst
autoload colors; colors;
autoload -Uz add-zsh-hook
local RANDOM_COLOR=$'%F{$[1+RANDOM%7]}'
p_anim_counter=0
p_anim=(
    "(´ ・ω ・\` )"
    "(  ´ ・ω ・)"
    "(    ´ ・ω )"
    "(      ´ ・)"
    "(          )"
    "(・\`       )"
    "(ω ・\`     )"
    "(・ω ・\`   )"
)
function _precmd_anim () {
    psvar[1]=$p_anim[`expr $p_anim_counter % ${#p_anim[*]} + 1`]
    p_anim_counter=`expr $p_anim_counter + 1`
}
add-zsh-hook precmd _precmd_anim
## 顔文字end

# cat
alias cat='~/local/bin/cat.sh'

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
