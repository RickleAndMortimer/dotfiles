autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '%b'
alias edit-nixos-config="sudo nvim /etc/nixos/configuration.nix"
alias edit-home-manager-config="sudo nvim /etc/nixos/home-manager.nix"
export NIXOS_DOTFILES="/etc/nixos/dotfiles/"
export NIXOS_CONFIG="/etc/nixos/"
