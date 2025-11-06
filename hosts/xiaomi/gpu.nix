{ lib, config, pkgs, ... }:
{
  services.xserver.videoDrivers = [ "modesetting" "fbdev" ]; # "vesa" 

  # Enable OpenCL support for Intel Gen8 and later GPUs
  nixpkgs.config.packageOverrides = pkgs: {
    vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
  };

  hardware.graphics = {
    enable = true;
    #extraPackages = with pkgs; [
      # intel-media-driver # LIBVA_DRIVER_NAME=iHD
      # vaapiVdpau
      # libvdpau-va-gl
    #];
  };
}
