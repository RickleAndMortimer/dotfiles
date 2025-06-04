{ config, lib, pkgs, ... }:

{
  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.displayManager.lightdm.extraConfig = "logind-check-graphical=true";

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;
  programs.hyprland.enable = true;

  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Enable i3.
  # services.xserver.windowManager.i3.enable = true;
}
