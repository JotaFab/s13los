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
    };

    # Your environment variables
    initExtra = ''
      export GOPATH=$HOME/go
      export PATH="$PATH:$HOME/go/bin"
      export PATH="$PATH:$HOME/.local/bin"
      eval "$(starship init bash)"
    '';

  };

}
