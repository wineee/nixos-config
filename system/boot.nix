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

    plymouth.enable = false;

    #kernelPackages = pkgs.linuxPackages_xanmod;
    kernelPackages = pkgs.linuxPackages_latest;

    extraModprobeConfig = ''
      options kvm_intel nested=1
      options kvm_intel emulate_invalid_guest_state=0
      options kvm ignore_msrs=1
    '';
    #  options bbswitch load_state=0 unload_state=1
    #'';

    # extraModulePackages = [ pkgs.linuxPackages_latest.bbswitch ];
    # kernelModules = [ "bbswitch" ];
    # blacklistedKernelModules = [ "nouveau" ];

    binfmt.emulatedSystems = [ "riscv64-linux" "aarch64-linux" ];
  };

  fileSystems."/data" = {
    device = "/dev/disk/by-uuid/536c0423-2436-415f-90a2-eebf828b501b";
    fsType = "xfs";
  };
}
