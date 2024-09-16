#!/bin/zsh

## Completion
[[ -f $ZDOTDIR/local/fpath ]] && source $ZDOTDIR/local/fpath
fpath=($ZDOTDIR/plugins/zsh-completions/src $fpath)
autoload -Uz compinit && compinit
autoload -U +X bashcompinit && bashcompinit
zstyle ':completion:*' menu select
source $ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh


## Extra Options
unsetopt BEEP


## Prompt
autoload -Uz vcs_info
autoload -U colors && colors

zstyle ':vcs_info:*' enable git

precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst

zstyle ':vcs_info:git*+set-message:*' hooks git-untracked

+vi-git-untracked(){
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
        git status --porcelain | grep '??' &> /dev/null ; then
        hook_com[staged]+='!' # signify new files with a bang
    fi
}

zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git:*' formats " %{$fg[blue]%}(%{$fg[red]%}%m%u%c%{$fg[yellow]%}%{$fg[white]%} %b%{$fg[blue]%})%{$reset_color%}"

PROMPT="%B%{$fg[white]%}[%{$fg[green]%}%n%{$fg[white]%}@%{$fg[red]%}%m%{$fg[white]%}] %{$fg[magenta]%}%c%{$reset_color%}"
PROMPT+="\$vcs_info_msg_0_ ➤ "


## History
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
export HISTSIZE=2000
export SAVEHIST=$HISTSIZE
export HISTFILE="$XDG_CACHE_HOME/history"
export LESSHIST="$XDG_CACHE_HOME/less_history"


## Keybinds
# custom widgets
backward-kill-dir () {
    local WORDCHARS=${WORDCHARS/\/}
    zle backward-kill-word
}
zle -N backward-kill-dir

# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"
key[Ctrl-Left]="${terminfo[kLFT5]}"
[[ -z "${key[Ctrl-Left]}" ]] && key[Ctrl-Left]="\e[1;5D"
key[Ctrl-Right]="${terminfo[kRIT5]}"
[[ -z "${key[Ctrl-Right]}" ]] && key[Ctrl-Right]="\e[1;5C"
key[Ctrl-Backspace]="^H"

# setup key accordingly
[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"         beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"          end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"       overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}"    backward-delete-char
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"       delete-char
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"           up-line-or-history
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"         down-line-or-history
[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"         backward-char
[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"        forward-char
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"       beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"     end-of-buffer-or-history
[[ -n "${key[Shift-Tab]}" ]] && bindkey -- "${key[Shift-Tab]}"    reverse-menu-complete
[[ -n "${key[Ctrl-Left]}" ]] && bindkey -- "${key[Ctrl-Left]}"    backward-word
[[ -n "${key[Ctrl-Right]}" ]] && bindkey -- "${key[Ctrl-Right]}"  forward-word
[[ -n "${key[Ctrl-Backspace]}" ]] && bindkey -- "${key[Ctrl-Backspace]}" backward-kill-dir

# vi mode key maps
bindkey -a "${key[Ctrl-Left]}" backward-word # tty errors
bindkey -a "${key[Ctrl-Right]}" forward-word # tty errors

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start { echoti smkx }
	function zle_application_mode_stop { echoti rmkx }
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi


## Runtime Commands
# cat for csv files
csv() { sed 's/,,/, ,/g' "$1" | column -s, -t; }

# Aliases
alias ll="ls -lo"
alias la="ll -a"
alias rm="rm -I"

# Conditional Configurations
alias_if_exists() {
    if command -v "$1" >/dev/null 2>&1; then
        alias "$2"
    fi
}

alias_if_exists zoxide 'cd=z'
alias_if_exists nvim 'vi=nvim'
alias_if_exists eza 'ls=eza -g --hyperlink'
alias_if_exists bat 'bat=bat --theme=base16-256'
alias_if_exists bat 'cat=bat -pp'
alias_if_exists btm 'top=btm -b'
alias_if_exists rip 'rt=rip'
alias_if_exists feh 'feh=feh -Z.B black'
alias_if_exists fastfetch 'clearf=$(which clear) && fastfetch'
alias_if_exists tmux 'tmux-session=tmux new -As'

if command -v zoxide >/dev/null 2>&1; then eval "$(zoxide init zsh)"; fi

## Custom Runtime Commands
[[ -f $ZDOTDIR/local/zshrc ]] && source $ZDOTDIR/local/zshrc


## Syntax Highlighting
source $ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
