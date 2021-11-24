{ pkgs,  ... }:

{
  # this is needed to get a bridge with DHCP enabled
  virtualisation = {
    
    libvirtd = {
      enable = true;
      qemu.ovmf.enable = true;
      qemu.swtpm.enable = true;
      qemu.runAsRoot = true;
    };
    
    podman = {
      enable = true;
      dockerCompat = true;
    };

  };
}
