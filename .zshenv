export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DATA_HOME="${HOME}/.local/share"
export KITS_HOME="${HOME}/.local/kits"
export SRC_HOME="${HOME}/.local/src"

export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"
export XDOTDIR="${XDG_CONFIG_HOME}/Xorg"

export LOCAL_PATH=""
export LOCAL_LD_LIBRARY_PATH=""
export LOCAL_MANPATH=""

[[ -f "$ZDOTDIR/local/zshenv" ]] && source "$ZDOTDIR/local/zshenv"

export LOCAL_PATH="${HOME}/.local/bin:${LOCAL_PATH}"
export LOCAL_PATH="${LOCAL_PATH%:}"

export LOCAL_LD_LIBRARY_PATH="${HOME}/.local/lib:${LOCAL_LD_LIBRARY_PATH}"
export LOCAL_LD_LIBRARY_PATH="${HOME}/.local/lib64:${LOCAL_LD_LIBRARY_PATH}"
export LOCAL_LD_LIBRARY_PATH="${LOCAL_LD_LIBRARY_PATH%:}"

export LOCAL_MANPATH="${XDG_DATA_HOME}/man:${LOCAL_MANPATH}"
export LOCAL_MANPATH="${LOCAL_MANPATH%:}"

export WGETRC="${XDG_CONFIG_HOME}/wgetrc"
export NPM_CONFIG_CACHE="${XDG_CACHE_HOME}/npm"

export GTK_THEME="Adwaita:dark"

