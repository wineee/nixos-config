{ pkgs, ... }:

{
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      #grub = {
      #  enable = true;
      #  device = "nodev";
      #  useOSProber = true;
      #  efiSupport = true;
      #};
    };

    plymouth.enable = false;

    kernelPackages = pkgs.linuxPackages_latest;

    extraModprobeConfig = ''
      options kvm_intel nested=1
      options kvm_intel emulate_invalid_guest_state=0
      options kvm ignore_msrs=1
    '';

    # binfmt.emulatedSystems = [ "riscv64-linux" "aarch64-linux" ];
  };
}
