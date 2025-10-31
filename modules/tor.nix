{ config, pkgs, ... }:

{
  #############################
  # TOR AS A CLIENT ONLY
  #############################
  services.tor = {
    enable = true;
    client = {
      enable = true;
    };
    # disable relay functionality explicitly
    relay = {
      enable = false;
    };
    settings = {
      UseBridges = true;
      ClientTransportPlugin = "obfs4 exec ${pkgs.obfs4}/bin/lyrebird";
      Bridge = "obfs4 IP:ORPort [fingerprint]";
    };
  };

  #############################
  # TORSOCKS (optional helper)
  #############################
  environment.systemPackages = with pkgs; [
    torsocks
    tor-browser
  ];
}
