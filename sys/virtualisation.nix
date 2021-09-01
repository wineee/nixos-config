{ pkgs,  ... }:

{
  # this is needed to get a bridge with DHCP enabled
  virtualisation.libvirtd.enable = true;
  virtualisation.libvirtd.qemuOvmf = true;

  nixpkgs.config.packageOverrides  = pkgs: {
    vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; }; 
  };

  # podman
  virtualisation.podman.enable = true;
  virtualisation.podman.dockerCompat = true;
}
