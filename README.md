# s13los NixOS/Hyprland Configuration

This repository manages the NixOS system and user configuration for the `s13l` user, featuring a Hyprland-based Wayland desktop, custom theming, and a curated set of tools. It uses Nix flakes and Home Manager for modular, reproducible configuration.

## Structure

- **flake.nix**: Entry point; defines system and user config, imports `configuration.nix` and Home Manager modules.
- **configuration.nix**: Main NixOS system config (hardware, boot, networking, users).
- **modules/home/**: Home Manager modules for user-level config:
  - `home.nix`: Aggregates user config, imports other modules.
  - `hyprland.nix`: Hyprland window manager settings (apps, env, exec-once, theming).
  - `waybar.nix`: Waybar status bar config and theming.
  - `bash.nix`, `tmux.nix`, `hyprpaper.nix`: Shell, terminal multiplexer, and wallpaper service config.

## Usage

- **Rebuild system**:  
  `sudo nixos-rebuild switch --flake .#s13l`
- **Update flake inputs**:  
  `nix flake update`
- **Apply user config only**:  
  `home-manager switch --flake .#s13l`
- **Debugging**:  
  Use `journalctl -xe`, `systemctl status <service>`, and `hyprctl` for Hyprland issues.

## Conventions

- All user-level config is modularized in `modules/home/` and imported via `home.nix`.
- Shell aliases and environment variables are set in `bash.nix`.
- Wayland/Hyprland is the default session; X11 is not configured.
- Theming: Colors and UI settings are centralized in `waybar.nix` and `hyprland.nix`.
- Default apps: Terminal (`ghostty`), file manager (`thunar`), menu (`wofi`), browser (`chromium`).
- Git user config is set in `home.nix` under `programs.git`.

## Examples

- To add a new user package, edit `home.nix` under `home.packages`.
- To change the default terminal, update `$terminal` in `hyprland.nix` and `waybar.nix`.
- To add a new shell alias, edit `bash.nix` under `shellAliases`.

## References

- [NixOS Manual](https://nixos.org/manual/nixos/stable/)
- [Home Manager Manual](https://nix-community.github.io/home-manager/)
- [Hyprland Wiki](https://wiki.hyprland.org/)

---
For major changes, update both system and user configs and test with a full rebuild.
