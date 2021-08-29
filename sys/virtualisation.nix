{ pkgs,  ... }:

{
  # this is needed to get a bridge with DHCP enabled
  virtualisation.libvirtd.enable = true;
  
  nixpkgs.config.packageOverrides  = pkgs: {
    vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; }; 
  };

  # 
  virtualisation.podman.enable = true;
  virtualisation.podman.dockerCompat = true;
}
