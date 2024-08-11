{ config, pkgs, ... }:
let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-24.05.tar.gz";
in
{
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager.users.nathan = {
    /* The home.stateVersion option does not have a default and must be set */
    home.stateVersion = "24.05";
    home.packages = with pkgs; [ 
      feh
      firefox
      git
      glib
      hunspell
      inkscape
      libreoffice-qt
      neofetch
      python3
      spotify
      texliveFull
      webcord-vencord
      zathura
      # hyprland dependencies
      brightnessctl
      dolphin
      dunst
      fuzzel
      grim
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

    programs.bash.enable = true;
    programs.git.enable = true;

    home.file = {
      ".config/hypr" = {
        source = ./dotfiles/hypr;
        recursive = true;
      };
      ".config/git" = {
        source = ./dotfiles/git;
        recursive = true;
      };
    };

    wayland.windowManager.hyprland.enable = true;
  };
}
