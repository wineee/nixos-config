{ pkgs, ... }:

{
  # this is needed to get a bridge with DHCP enabled
  virtualisation = {

    libvirtd = {
      enable = false;
      qemu.ovmf.enable = true;
      qemu.swtpm.enable = true;
      qemu.runAsRoot = true;
      qemu.package = pkgs.qemu;
    };

    #podman = {
    #  enable = true;
    #  dockerCompat = true;
    #};

    docker.enable = true;
  };

  environment.systemPackages = with pkgs; [
    virt-manager
  ];
}
