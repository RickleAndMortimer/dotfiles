PROMPT='%{$fg[yellow]%}[%D{%f/%m/%y} %D{%L:%M:%S}] %{$fg[white]%}'$PROMPT
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT='${vcs_info_msg_0_}'
zstyle ':vcs_info:git:*' formats '%b'
PROMPT=$PROMPT'%{$reset_color%}'
