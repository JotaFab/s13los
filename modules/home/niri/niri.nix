{ config, pkgs, ... }:

{
	xdg.configFile."niri/config.kdl".source = ./config.kdl;
  home.file.".local/bin/nws.sh".source = ./nws.sh;
  
}
