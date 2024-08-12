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
    fonts.fontconfig = {
	enable = true;
	defaultFonts = {
	    monospace = [ "FiraCode" ];
	};
    };
    home.stateVersion = "24.05";
    home.packages = with pkgs; [ 
      # shell
      oh-my-zsh
      zsh
      nerdfonts.override { fonts = [ "Neon" "DroidSansMono" ]; })
      # applications
      feh
      firefox
      git
      glib
      hunspell
      inkscape
      libreoffice-qt
      luarocks
      neofetch
      python3
      spotify
      texliveFull
      webcord-vencord
      zathura
      # nvim dependencies
      gcc
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

    programs.bash = {
    	enable = true;
	bashrcExtra = (builtins.readFile ./dotfiles/.bashrc);
    };
    
    programs.zsh = {
    	enable = true;
	initExtra = (builtins.readFile ./dotfiles/.zshrc);
	autosuggestion.enable = true;
	syntaxHighlighting.enable = true;
	oh-my-zsh = {
	    enable = true;
	    plugins = [ "git" ];
	};
    };

    programs.git.enable = true;
    programs.neovim.enable = true;

    home.file = {
      ".config/hypr" = {
        source = ./dotfiles/hypr;
        recursive = true;
      };
      ".config/git" = {
        source = ./dotfiles/git;
        recursive = true;
      };
      ".config/swayidle" = {
        source = ./dotfiles/swayidle;
        recursive = true;
      };
      ".config/nvim" = {
        source = ./dotfiles/nvim;
        recursive = true;
      };
    };

    wayland.windowManager.hyprland.enable = true;
  };
}
