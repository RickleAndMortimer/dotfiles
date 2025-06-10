{ config, pkgs, home-manager, ... }: 

{
  /* The home.stateVersion option does not have a default and must be set */
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = [ "Monaspace Neon" ];
    };
  };
  home.stateVersion = "24.05";
  home.packages = with pkgs; [ 
    # shell
    oh-my-zsh
    zsh
    # applications
    discord-ptb
    feh
    firefox
    fzf
    git
    glib
    godot_4
    hunspell
    inkscape
    kdePackages.qtsvg
    libreoffice-qt
    luarocks
    monaspace
    neofetch
    neovim
    oh-my-zsh
    python3
    spotify
    texliveFull
    webcord-vencord
    zathura
    # nvim dependencies
    gcc
    pyright
    # hyprland dependencies
    brightnessctl
    dolphin
    dunst
    fuzzel
    grim
    hyprland
    hypridle
    hyprlock
    hyprpaper
    kitty
    pamixer
    playerctl
    shotman
    slurp
    swayidle
    waybar
    wl-clipboard
    wofi
  ];
    
  programs.bash = {
    enable = true;
    bashrcExtra = (builtins.readFile /etc/nixos/users/dotfiles/nathan/.bashrc);
  };

  programs.zsh = {
    enable = true;
    initExtra = (builtins.readFile /etc/nixos/users/dotfiles/nathan/.zshrc);
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      custom = "/etc/nixos/users/dotfiles/nathan/.oh-my-zsh";
      theme = "everforest";
    };
  };
    
  home.sessionVariables.NIXOS_OZONE_WL = "1";
  nixpkgs.config.allowUnfree = true;
    
  home.file = {
    ".config/git" = {
      source = config.lib.file.mkOutOfStoreSymlink /etc/nixos/users/dotfiles/nathan/.config/git;
      recursive = true;
    };
    ".config/hypr" = {
      source = config.lib.file.mkOutOfStoreSymlink /etc/nixos/users/dotfiles/nathan/.config/hypr;
      recursive = true;
    };
    ".config/swayidle" = {
      source = config.lib.file.mkOutOfStoreSymlink /etc/nixos/users/dotfiles/nathan/.config/swayidle;
      recursive = true;
    };
    ".config/nvim" = {
      source = config.lib.file.mkOutOfStoreSymlink /etc/nixos/users/dotfiles/nathan/.config/nvim;
      recursive = true;
    };
    ".config/fuzzel" = {
      source = config.lib.file.mkOutOfStoreSymlink /etc/nixos/users/dotfiles/nathan/.config/fuzzel;
      recursive = true;
    };
    ".config/waybar" = {
      source = config.lib.file.mkOutOfStoreSymlink /etc/nixos/users/dotfiles/nathan/.config/waybar;
      recursive = true;
    };
    ".config/kitty" = {
      source = config.lib.file.mkOutOfStoreSymlink /etc/nixos/users/dotfiles/nathan/.config/kitty;
      recursive = true;
    };
    ".oh-my-zsh" = {
      source = config.lib.file.mkOutOfStoreSymlink /etc/nixos/users/dotfiles/nathan/.oh-my-zsh;
      recursive = true;
    };
  }; 
}
