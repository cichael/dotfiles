## This file encoding:utf8
## This file line feed code:LF

## encoding
export LANG=ja_JP.UTF-8

## use color
autoload -U colors
colors
setopt prompt_subst
export LSCOLORS=gxfxcxdxbxegedabagacad
export LS_COLORS='di=04;36:ln=04;35:so=00;32:ex=00;37:bd=46;36:cd=43;36:su=41;30:sg=46;30:tw=42;30:ow=43;30'
export ZLS_COLORS=$LS_COLORS
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

## prompt
autoload -U colors && colors

PROMPT="%{%(?.$fg[black].$fg[red])%}>%{$reset_color%} "

autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '%b'
zstyle ':vcs_info:*' actionformats '%b|%a'
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [ -n "$vcs_info_msg_0_" ] && psvar[1]="$vcs_info_msg_0_"
}
RPROMPT="[%f%F{blue}%1(v|%1v |)%f%~]%f"

#PROMPT="%U$USER@%m%%%u "
#RPROMPT="[%~]"
#
#precmd () {
#  PROMPT="%{%(?.$fg[black].$fg[red])%}>%{$reset_color%} "
#}

## no beep
setopt nobeep

## see http://d.hatena.ne.jp/walf443/20071119/1195487813
export WORDCHARS="*?_-.[]~=&;!#$%^(){}<>"

## path
##export PATH=.:~/bin:/opt/local/bin:/opt/local/sbin:$PATH
#export PATH=/bin:/usr/local/bin:/usr/local/sbin:$PATH
#export MANPATH=/opt/local/man:$MANPATH
#if [ -d $HOME/.rbenv/bin ]; then
#    export RBENV_ROOT=$HOME/.rbenv
#    export PATH="$RBENV_ROOT/bin:$PATH"
#    eval "$(rbenv init -)"
#fi

autoload -U compinit
compinit
setopt auto_list
setopt list_packed

## history
HISTFILE=$HOME/.zsh-history
HISTSIZE=100000
SAVEHIST=100000
setopt hist_ignore_dups

setopt auto_pushd
setopt pushd_ignore_dups

## ls next to cd
function chpwd() { ls -G }

#alias globals
alias -g st='status'
alias -g G='| egrep'
alias -g L='| less -r'
alias -g H='| head'
alias -g T='| tail'
alias -g C='| pbcopy'
alias -g W='| nkf -w'
alias -g XG='| xargs grep'

## via http://github.com/ryanb/dotfiles/blob/master/zsh/aliases
alias %=' '
alias v="vim"
alias c="cd"

## ls
alias ls="ls -G"
alias ll="ls -la -G"

## git
alias s='git status'
#alias -g ci='commit'
#alias -g co='chekcout'

## grep
alias grep="grep --color=always"

### Added by the Heroku Toolbelt
#export PATH="/usr/local/heroku/bin:$PATH"

#alias top > htop
alias top="htop"


# homebrew github
export HOMEBREW_GITHUB_API_TOKEN=ff28f52a88775010ae0c88a5cdef70db5dc18448
