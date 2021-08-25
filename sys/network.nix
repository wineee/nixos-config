{ ... }:

{
  networking.hostName = "nixos"; # Define your hostname.
 
  # Enables wireless support via wpa_supplica>
  # networking.wireless.enable = true; 
 
  networking.networkmanager.enable = true;
 
  # use nmcil/nmtui to manager network 
<<<<<<< HEAD
  #programs.nm-applet.enable = true;
=======
  programs.nm-applet.enable = true;
>>>>>>> 7f5db9b7f084e2873c5b077b77e4a2677f8c6e9a

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.wlp2s0.useDHCP = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
<<<<<<< HEAD
  #networking.proxy.allProxy = "http://127.0.0.1:8889";
  #networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
=======
  networking.proxy.allProxy = "http://127.0.0.1:8889";
  networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
>>>>>>> 7f5db9b7f084e2873c5b077b77e4a2677f8c6e9a

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
}
