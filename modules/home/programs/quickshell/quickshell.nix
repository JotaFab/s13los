{ pkgs, ... }:

{
  # Noctalia shell (built on Quickshell). Config lives in ~/.config/noctalia
  home.packages = [ pkgs.noctalia-shell ];
}
