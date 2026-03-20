autoload -Uz add-zle-hook-widget

# Show preview only for aliases whose expanded command starts with these words.
# Add more commands as needed.
typeset -ga ALIAS_PREVIEW_COMMANDS=(git docker)

typeset -g _alias_preview_last=""

function _preview_alias_message() {
    local trimmed="${BUFFER#"${BUFFER%%[! ]*}"}"
    local first_word="${trimmed%% *}"

    local msg=""

    if [[ -n "$first_word" && -n "${aliases[$first_word]}" ]]; then
        local expanded="${aliases[$first_word]}"
        local exp_cmd="${expanded%% *}"
        if (( ${ALIAS_PREVIEW_COMMANDS[(Ie)$exp_cmd]} )); then
            if (( ${#expanded} > 80 )); then
                expanded="${expanded[1,77]}..."
            fi
            msg="    ↳ 💡: ${expanded}"
        fi
    fi

    if [[ "$msg" != "$_alias_preview_last" ]]; then
        _alias_preview_last="$msg"
        zle -M "$msg"
    fi
}

add-zle-hook-widget line-pre-redraw _preview_alias_message
