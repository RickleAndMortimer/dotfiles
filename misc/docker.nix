{ config, lib, pkgs, ... }:

{
	virtualisation.docker.enable = true;
	users.users.nathan.extraGroups = [ "docker" ];
	virtualisation.docker.rootless = {
		enable = true;
		setSocketVariable = true;
	};
}
