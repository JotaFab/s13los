{ config, pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    prefix = "C-Space";
    keyMode = "vi";
    newSession = true;
    plugins = [
    ];
    extraConfig = ''
      set -g @plugin 'tmux-plugins/tpm'
      set -g @plugin 'tarquibrian/vanzi'
      set -g @theme_variant "vanzi"
      set -g @bg_transparency "on"
          
      run-shell "~/.config/tmux/plugins/vanzi-tmux-theme/vanzi.tmux"
      run '~/.config/tmux/plugins/tpm/tpm'
    '';
    mouse = true;
  };
}
