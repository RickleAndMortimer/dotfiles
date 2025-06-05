export EDITOR="nvim"
PROMPT=$'%F{#d3c6aa}%K{#d3c6aa}%B%F{#1e2326} %n%k%F{#d3c6aa}%F{#d3c6aa}%F{#1e2326}%K{#d3c6aa} %1~%k%F{#d3c6aa}$(git_prompt_info)\
%F{#d3c6aa}󰁕%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="%F{#d3c6aa}%F{#1e2326}%K{#d3c6aa} "
ZSH_THEME_GIT_PROMPT_SUFFIX="%k%F{#d3c6aa}%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="*%F{#1e2326}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

precmd() {
    precmd() {
        echo
    }
}
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '%b'
alias edit-nixos-config="sudo nvim /etc/nixos/configuration.nix"
alias edit-home-manager-config="sudo nvim /etc/nixos/home-manager.nix"
export NIXOS_DOTFILES="/etc/nixos/dotfiles/"
export NIXOS_CONFIG="/etc/nixos/"
