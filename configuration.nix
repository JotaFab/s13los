{ config, pkgs, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  nixpkgs.config.allowUnfree = true;

  # Bootloader
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };
  boot.kernelPackages = pkgs.linuxPackages;

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
  };

  time.timeZone = "America/Lima";
  i18n.defaultLocale = "en_US.UTF-8";

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  users.users.s13l = {
    isNormalUser = true;
    description = "s13l";
    extraGroups = [
      "networkmanager"
      "wheel"
      "wireshark"
      "docker"
    ];
    packages = with pkgs; [
      chromium
    ];
  };

  environment.systemPackages = with pkgs; [
    neovim
    wget
    davinci-resolve
    wl-clipboard-rs
    git
    curl
    hyprland
    hypridle
    hyprlock
    hyprpaper
    discord
    wlogout
    obs-studio
    spotify
    waybar
    lsd
    bat
    tmux
    lazygit
    fzf
    lazydocker
    wofi
    ghostty
    vscode
    adw-gtk3
    papirus-icon-theme
    xfce.thunar
    gnumake
    go
    ly
    fastfetch
    btop
    steam
    bitwarden
    docker
    docker-compose
    xdg-desktop-portal-hyprland
    polkit
    nixfmt-rfc-style
    obsidian
    nmap
    openvpn
    hashcat
    burpsuite
    caido
    wireshark
    rockyou
    seclists
    metasploit
    gobuster
    ffuf
    sqlmap
    john
    hydra
  ];

  hardware = {
    graphics.enable = true;
    nvidia = {
      modesetting.enable = true;
      open = true;
    };
  };
  services.xserver.videoDrivers = [ "nvidia" ];

  programs = {
    wireshark.enable = true;
    hyprland.enable = true;
    xwayland.enable = true;
    hyprlock.enable = true;
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
    gamemode.enable = true;
  };

  fonts = {
    fontconfig.enable = true;
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
    ];
  };

  services = {
    displayManager.enable = true;
    displayManager.ly.enable = true;
    # services.openssh.enable = true;
  };

  security.polkit.enable = true;
  virtualisation.docker.enable = true;

  environment.sessionVariables = {
    GTK_THEME = "adw-gtk3-dark";
    GTK_APPLICATION_PREFER_DARK_THEME = "1";
    PREFERRED_COLOR_SCHEME = "dark";
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # networking.firewall.enable = false;

  system.stateVersion = "25.05";
}
