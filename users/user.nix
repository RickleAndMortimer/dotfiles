{ config, lib, pkgs, ... }:

{
  users.users.nathan = {
    isNormalUser = true;
    home = "/home/nathan";
    description = "Me";
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "networkmanager" "audio" "wireshark" ]; 
  };
}
