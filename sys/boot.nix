{ pkgs, ... }:

{
  # Do not Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = false;
  
  # Use GRand Unified Bootloader
  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      version = 2;
      device = "nodev";
      useOSProber = true;
      efiSupport = true;
    };
  };
  
  # boot.plymouth.enable = true;

  boot.kernelPackages = pkgs.linuxPackages_xanmod;

  boot.extraModprobeConfig = ''
    options kvm_intel nested=1
    options kvm_intel emulate_invalid_guest_state=0
    options kvm ignore_msrs=1
  '';

}
