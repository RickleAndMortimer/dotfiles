{ config, ... }:

{
  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.wireless.userControlled.enable = true; 
  networking.wireless.environmentFile = "/etc/nixos/wireless.env";
  networking.wireless.networks = {
    "@HOME_SSID@" = {
      psk = "@HOME_PSK@";
    };
    "@APT_SSID@" = {
      psk = "@APT_PSK@";
    };
    "@SCHOOL_SSID@" = {
      auth = ''
	key_mgmt=WPA-EAP
	eap=PEAP
	phase2="auth=MSCHAPV2"
	identity="@SCHOOL_IDENTITY@"
	password="@SCHOOL_PASSWORD@"
      '';
    };
  };
}
