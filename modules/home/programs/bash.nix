{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    enableCompletion = true;

    shellAliases = {
      grep = "grep --color=auto";
      ls = "lsd";
      ll = "ls -l";
      la = "ls -lAtr";
      cat = "bat";
      ta = "tmux a";
      
      # NixOS maintenance
      update = "sudo nixos-rebuild switch --flake .#s13los --show-trace";
      clean = "nh clean all --keep 3";
      fup = "nix flake update";
    };

    # Your environment variables
    initExtra = ''
      export PATH="$HOME/.local/bin:$PATH"
      export GOPATH=$HOME/go
      export PATH="$PATH:$HOME/go/bin"
      eval "$(starship init bash)"
      eval "fastfetch"
    '';

  };

}
