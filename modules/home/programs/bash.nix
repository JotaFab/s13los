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
      update = "nh os switch ~/s13los";
      clean = "nh clean all --keep 3";
      fup = "nix flake update --flake ~/s13los";
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
