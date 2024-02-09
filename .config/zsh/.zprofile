#!/bin/zsh

add_to_path() {
    local path_to_add=$1
    local env_var_name=$2
    local current_value="${(P)env_var_name}"

    if [[ ":${current_value}:" != *":${path_to_add}:"* ]]; then
        export ${env_var_name}="${path_to_add}:${current_value}"
    fi
    export ${env_var_name}="${(P)env_var_name%:}"
}

source ${HOME}/.zshenv

add_to_path "$LOCAL_PATH" PATH
add_to_path "$LOCAL_LD_LIBRARY_PATH" LD_LIBRARY_PATH
add_to_path "$LOCAL_MANPATH" MANPATH

[[ -f $ZDOTDIR/local/zprofile ]] && source $ZDOTDIR/local/zprofile

