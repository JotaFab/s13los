{ config, pkgs, ... }:

{
  home.username = "s13l";
  home.homeDirectory = "/home/s13l";
  home.stateVersion = "25.05";

  imports = [
    ./hyprland.nix
    ./hyprpaper.nix
    ./waybar.nix
    ./tmux.nix
    ./bash.nix
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
  ];

  ########################################
  # 🧬 Git config
  ########################################
  programs.git = {
    enable = true;
    userName = "jotafab";
    userEmail = "fabrizioore512@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = true;
      color.ui = "auto";
    };
  };

  ########################################
  # 🖥️ Shell config (optional)
  ########################################
  programs.bash.enable = true;

  services.swaync.enable = true;

}
