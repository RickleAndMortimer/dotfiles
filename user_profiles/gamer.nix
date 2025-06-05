{ pkgs, config, lib, ... }:
{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "steam"
    "steam-original"
    "steam-unwrapped"
    "steam-run"
  ];

  environment.systemPackages = with pkgs; [
    heroic
    lutris
    vulkan-tools
    wineWowPackages.waylandFull
  ];
}
