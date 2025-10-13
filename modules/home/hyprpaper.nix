{ config, pkgs, ... }:

{
  # Enable hyprpaper via home-manager (if using it)
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [
        "~/Pictures/wallpapers/cyberpunk.jpg"
      ];

      wallpaper = ",~/Pictures/wallpapers/cyberpunk.jpg";
      

      splash = true;        # optional splash fade
      ipc = true;           # allows hyprctl hyprpaper control
    };
  };
}
