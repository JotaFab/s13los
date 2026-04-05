{ config, pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    mouse = true;
    prefix = "C-Space";
    keyMode = "vi";
    newSession = true;
    extraConfig = ''
      set-option -g default-terminal "screen-256color"

      bind c new-window -c "#{pane_current_path}"
      bind '"' split-window -c "#{pane_current_path}"
      bind % split-window -h -c "#{pane_current_path}"

      set -g status-right "#[fg=colour39]#(ip link show wg0 2>/dev/null | grep -q UP && echo '🔒 VPN-CSD' || echo '') #[fg=colour39]%H:%M"
      set -g @plugin 'tmux-plugins/tpm'
      set -g @plugin 'tarquibrian/vanzi'
      set -g @theme_variant "vanzi"
      set -g @bg_transparency "on"


      run-shell "~/.config/tmux/plugins/vanzi-tmux-theme/vanzi.tmux"
      run '~/.config/tmux/plugins/tpm/tpm'
    '';
  };
}
