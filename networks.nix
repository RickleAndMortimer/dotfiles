{ config, ... }:

{
  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.wireless.userControlled.enable = true; 
  networking.wireless.secretsFile = "/etc/nixos/wireless.env";
  networking.wireless.networks = {
    "Fios-H6cWm" = {
      pskRaw = "ext:HOME_PSK";
    };
    "311.C1" = {
      pskRaw = "ext:APT_PSK";
    };
  };
}
