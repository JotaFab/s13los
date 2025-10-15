{ config, pkgs, ... }:

{
  home.username = "s13l";
  home.homeDirectory = "/home/s13l";
  home.stateVersion = "25.05";

  imports = [
    ./waybar/waybar.nix
    ./niri/niri.nix
    ./bash.nix
    ./wofi.nix
    ./tmux.nix
    ./ghostty.nix
  ];

  ########################################
  # 🧰 User tools and base config
  ########################################
  home.packages = with pkgs; [
    fastfetch
    btop
    neovim
    tmux
    starship
    swaynotificationcenter
    waybar-mpris
    playerctl
    waypaper
    waybar
    swaylock
    swww
  ];

  gtk = {
    enable = true;
    theme.name = "Adwaita-dark";

    colorScheme = "dark";
  };
  qt = {
    style.name = "adwaita-dark";
  };
  
  ########################################
  # 🧬 Git config
  ########################################
  programs= {
    
    git = {
    enable = true;
    userName = "jotafab";
    userEmail = "fabrizioore512@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = true;
      color.ui = "auto";
    };
  };
  };

  ########################################
  # 🖥️ Shell config (optional)
  ########################################
  programs.bash.enable = true;
  services.swww.enable = true;

  services.swaync.enable = true;

}
