{ pkgs, ... }:

{
  boot = {
    loader.systemd-boot.enable = false;
    loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        version = 2;
        device = "nodev";
        useOSProber = true;
        efiSupport = true;
      };
    };
  # plymouth.enable = true;

    kernelPackages = pkgs.linuxPackages_xanmod;

    extraModprobeConfig = ''
      options kvm_intel nested=1
      options kvm_intel emulate_invalid_guest_state=0
      options kvm ignore_msrs=1
    '';
    binfmt.emulatedSystems = [ "alpha-linux" "riscv32-linux" "riscv64-linux" "aarch64-linux" ];
  };

  fileSystems."/data" = {
    device = "/dev/disk/by-uuid/536c0423-2436-415f-90a2-eebf828b501b";
    fsType = "xfs";
  };
}
