{ lib, ... }:
let 
  netifname = "eno1";
  # wlp2s0
in
{
  networking.hostName = "nixos"; # Define your hostname.

  # Enables wireless support via wpa_supplica>
  # networking.wireless.enable = true; 

  networking.networkmanager.enable = true;

  networking.interfaces.${netifname}.useDHCP = true;
  
  networking.iproute2.enable = true;

  services.v2raya.enable = true;

  # Configure network proxy
  # networking.proxy.default = "http://127.0.0.1:8889";
  # networking.proxy.allProxy = "http://127.0.0.1:8889";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Open ports in the firewall.
  #networking.firewall.enable = true;
  #networking.firewall.allowedTCPPorts = [ 22 80 ];
  #networking.firewall.allowedUDPPorts = [ ];

  #services.zerotierone = {
  #  enable = true;
  #  joinNetworks = [ "3efa5cb78ac0f127" ];
    #port = 9993;
  #};

  #services.resolved.fallbackDns = [ "10.20.0.10" ]; 
  #networking.nameservers =  [ "10.20.0.11" ];
  #networking.networkmanager.dns = "none";
  #networking.resolvconf.enable = lib.mkForce false;

  #networking.extraHosts = ''
  #  10.20.0.10 10.20.63.25
  #'';

}
