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

    # binfmt.emulatedSystems = [ "riscv64-linux" "aarch64-linux" ];
  };
}
