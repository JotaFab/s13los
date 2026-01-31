{ config, pkgs, lib, ... }:

{

  home.file.".config/waybar/config".source = ./waybar.conf;
  home.file.".config/waybar/style.css".source = ./waybar.css;

  # Optional: you can keep this if you want Nix to enable waybar
}
