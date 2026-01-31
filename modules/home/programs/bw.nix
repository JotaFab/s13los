{ globals, ... }:

{
  services.bitwarden-directory-connector-cli.domain = globals.Bwserver;
  services.bitwarden-directory-connector-cli.enable = true;
}
