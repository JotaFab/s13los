{
  config,
  pkgs,
  globals,
  inputs,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./modules/pentest.nix
  ];

  nixpkgs.config.allowUnfree = true;

  # Bootloader
  boot.loader = {
    systemd-boot.enable = false;
    grub.enable = true;
    grub.device = "nodev";
    grub.theme = pkgs.fetchFromGitHub {
      owner = "shvchk";
      repo = "fallout-grub-theme";
      rev = "80734103d0b48d724f0928e8082b6755bd3b2078";
      sha256 = "sha256-7kvLfD6Nz4cEMrmCA9yq4enyqVyqiTkVZV5y4RyUatU=";
    };
    grub.efiSupport = true;
    grub.useOSProber = true;
    efi.canTouchEfiVariables = true;
  };
  boot.kernelPackages = pkgs.linuxPackages;

  networking = {
    nameservers = [ "1.1.1.1" "9.9.9.9" ];
    hostName = globals.HostName;
    networkmanager.enable = true;
    hosts = (
      if builtins.pathExists ./hosts.nix then
        import ./hosts.nix
      else
        {

        }
    );
  };

  time.timeZone = "America/Lima";
  i18n.defaultLocale = "en_US.UTF-8";

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  users.users.${globals.UserName} = {
    isNormalUser = true;
    description = "Main User";
    extraGroups = [
      "wheel"
      "1000"
      "networkmanager"
      "wireshark"
      "docker"
    ];
    packages = with pkgs; [
      chromium
      google-chrome
      firefox
      godot
      gimp
      anki
      krita

    ];
  };
  environment.systemPackages = with pkgs; [
    ani-cli
    ffmpeg
    jq
    ripgrep
    fzf
    fastfetch
    btop
    ollama-vulkan
    caido
	python3
    starship
    waybar-mpris
    playerctl
    waypaper
    mpvpaper
    swww
    waybar
    swaylock-effects
    swayidle
    nvidia-vaapi-driver
    nvidia-modprobe
    swaynotificationcenter
    neovim
    wget
    davinci-resolve
    wl-clipboard-rs
    git
    glib
    steam-run
    curl
    wlogout
    discord
    obs-studio
    spotify
    lsd
    bat
    tmux
    fzf
    lazygit
    lazydocker
    wofi
    ghostty
    vscode
    adw-gtk3
    papirus-icon-theme
    nh
    nautilus
    gnumake
    go
    gopls
    musl
    gcc
    ly
    fastfetch
    btop
    steam
    pavucontrol
    bitwarden-desktop
    docker
    docker-compose
    xdg-desktop-portal-wlr
    polkit
    nixfmt
    obsidian
    openvpn
    qbittorrent

    grub2
    xwayland
    xwayland-satellite
  ];

  hardware = {
    graphics.enable = true;
    nvidia = {
      modesetting.enable = true;
      open = false;
    };
  };
  services.xserver.videoDrivers = [ "nvidia" ];

  xdg.portal.wlr.enable = true;
  fonts = {
    fontconfig.enable = true;
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      noto-fonts-cjk-sans
    ];
  };
  services = {
    ollama.enable = true;
    displayManager.enable = true;
    displayManager.ly.enable = true;
    # services.openssh.enable = true;
  }; 
  programs = {
    nix-ld.enable = true;
    niri.enable = true;
    xwayland.enable = true;
    wireshark.enable = true;

    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
    gamemode.enable = true;
  };
  security.polkit.enable = true;
  virtualisation.docker.enable = true;

  environment.variables = {
    LD_LIBRARY_PATH = "/run/opengl-driver/lib";
    ELECTRON_OZONE_PLATFORM_HINT = "wayland";
    OZONE_PLATFORM = "wayland";
    GDK_BACKEND = "wayland";
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # networking.firewall.enable = false;
  system.stateVersion = "25.11";

}
