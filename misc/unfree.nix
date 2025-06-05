{ pkgs, lib, ... }: 

{
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "discord"
      "spotify"
    ];
  nixpkgs.config.permittedInsecurePackages = [
    "electron-33.4.11"
  ];
}
