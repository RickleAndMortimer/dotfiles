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
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct
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
    clipse
    kdePackages.dolphin
    dunst
    fuzzel
    grim
    hyprcursor
    hypridle
    hyprland
    hyprlock
    hyprpaper
    hyprpolkitagent
    kitty
    pamixer
    playerctl
    shotman
    slurp
    swayidle
    udiskie
    waybar
    wl-clipboard
    wofi
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
  ];

  home.sessionVariables.NIXOS_OZONE_WL = "1";

  programs.bash = {
    enable = true;
    bashrcExtra = (builtins.readFile ./dotfiles/nathan/.bashrc);
  };
    
  programs.zsh = {
    enable = true;
    initExtra = (builtins.readFile ./dotfiles/nathan/.zshrc);
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
    };
  };
    
  nixpkgs.config.allowUnfree = true;
   
  home.file = {
    ".config/git" = {
      source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/users/dotfiles/nathan/git";
      recursive = true;
    };
    ".config/hypr" = {
      source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/users/dotfiles/nathan/hypr";
      recursive = true;
    };
    ".config/swayidle" = {
      source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/users/dotfiles/nathan/swayidle";
      recursive = true;
    };
    ".config/nvim" = {
      source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/users/dotfiles/nathan/nvim";
      recursive = true;
    };
    ".config/fuzzel" = {
      source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/users/dotfiles/nathan/fuzzel";
      recursive = true;
    };
    ".config/waybar" = {
      source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/users/dotfiles/nathan/waybar";
      recursive = true;
    };
    ".config/kitty" = {
      source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/users/dotfiles/nathan/kitty";
      recursive = true;
    };
    ".config/.zshrc" = {
      source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/users/dotfiles/nathan/.zshrc";
      recursive = true;
    };
  }; 
}
