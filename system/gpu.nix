{ lib, config, pkgs, ... }:
{
  # services.xserver.videoDrivers = [ "modesetting" "nvidia" "vesa" ]; 
  # hardware.bumblebee.enable = true;

  # Enable OpenCL support for Intel Gen8 and later GPUs
  nixpkgs.config.packageOverrides = pkgs: {
    vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
  };

  hardware.opengl = {
    enable = true;
    driSupport32Bit = true;
    extraPackages = with pkgs; [
      intel-media-driver # LIBVA_DRIVER_NAME=iHD
      vaapiVdpau
      libvdpau-va-gl
    ];
  };

}
