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
    bashrcExtra = (builtins.readFile ../dotfiles/.bashrc);
  };
    
  programs.zsh = {
    enable = true;
    initExtra = (builtins.readFile ../dotfiles/.zshrc);
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
    };
  };
    
  home.sessionVariables.NIXOS_OZONE_WL = "1";
  nixpkgs.config.allowUnfree = true;
    
  home.file = {
    ".config/git" = {
      source = config.lib.file.mkOutOfStoreSymlink ./../dotfiles/git;
      recursive = true;
    };
    ".config/hypr" = {
      source = config.lib.file.mkOutOfStoreSymlink ./../dotfiles/hypr;
      recursive = true;
    };
    ".config/swayidle" = {
      source = config.lib.file.mkOutOfStoreSymlink ./../dotfiles/swayidle;
      recursive = true;
    };
    ".config/nvim" = {
      source = config.lib.file.mkOutOfStoreSymlink ./../dotfiles/nvim;
      recursive = true;
    };
    ".config/fuzzel" = {
      source = config.lib.file.mkOutOfStoreSymlink ./../dotfiles/fuzzel;
      recursive = true;
    };
    ".config/waybar" = {
      source = config.lib.file.mkOutOfStoreSymlink ./../dotfiles/waybar;
      recursive = true;
    };
    ".config/kitty" = {
      source = config.lib.file.mkOutOfStoreSymlink ./../dotfiles/kitty;
      recursive = true;
    };
    ".config/.zshrc" = {
      source = config.lib.file.mkOutOfStoreSymlink ./../dotfiles/.zshrc;
      recursive = true;
    };
  }; 
}
