{ lib, config, pkgs, ... }:
{
  services.xserver.videoDrivers = [ "vesa" "modesetting" ]; #"nvidia"
  # hardware.bumblebee.enable = true;
  hardware = {
    #nvidia = {
    #  modesetting.enable = true;
    #  prime = {
        # nix-shell -p pciutils --run lspci
    #    offload.enable = true;
    #    intelBusId = "PCI:0:2:0";
    #    nvidiaBusId = "PCI:1:0:0";
    #  };
    #};
  };

  # Enable OpenCL support for Intel Gen8 and later GPUs
  nixpkgs.config.packageOverrides = pkgs: {
    vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
  };

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = with pkgs; [
      intel-media-driver # LIBVA_DRIVER_NAME=iHD
      vaapiIntel # LIBVA_DRIVER_NAME=i965 (older but works better for Firef>
      vaapiVdpau
      libvdpau-va-gl
    ];
  };

}
