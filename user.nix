{ config, lib, pkgs, ... }:

{
  users.users.nathan = {
    isNormalUser = true;
    home = "/home/nathan";
    description = "Me";
    extraGroups = [ "wheel" "networkmanager" "audio" "wireshark" ]; 
    openssh.authorizedKeys.keyFiles = [
        /etc/nixos/ssh/authorized_keys
    ];
  };
}
