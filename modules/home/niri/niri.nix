{ config, pkgs, ... }:

{
	xdg.configFile."niri/config.kdl".source = ./config.kdl;
	xdg.configFile."swaylock/config".source = ./mocha.conf;
  home.file.".local/bin/nws.sh".source = ./nws.sh;
  
}
