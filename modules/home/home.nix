{
  config,
  pkgs,
  globals,
  ...
}:

{
  home.stateVersion = "25.05";

  imports = [
    ./programs/waybar/waybar.nix
    ./programs/niri/niri.nix
    ./programs/bash.nix
    ./programs/wofi.nix
    ./programs/tmux.nix
    ./programs/nvim.nix
    ./programs/ghostty.nix
    ./programs/git.nix

  ];

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };
  gtk = {
    enable = true;
    theme.name = "Adwaita-dark";

    colorScheme = "dark";
  };
  qt = {
    enable = true;
    style.name = "adwaita-dark";
  };
  home.pointerCursor = {
    enable = true;
    gtk.enable = true;
    package = pkgs.catppuccin-cursors.mochaSapphire;
    name = "catppuccin-mocha-sapphire-cursors";
    size = 12;
  };

  ########################################
  # 🧬 Git config
  ########################################
  programs = {
    go.enable = true;
    bash.enable = true;
    zoxide.enable = true;
    obs-studio.enable = true;
    obs-studio.plugins = [ pkgs.obs-studio-plugins.wlrobs ];

  };

  services.swww.enable = true;
  services.swaync.enable = true;

}
