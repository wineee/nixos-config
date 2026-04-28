{ lib, config, pkgs, ... }:
{
  services.xserver.videoDrivers = [ "modesetting" "fbdev" ];# "vesa" 

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
  hardware.nvidia = {
    modesetting.enable = true;

    powerManagement.enable = false;
    powerManagement.finegrained = false;

    open = true;

    nvidiaSettings = true;

    #package = config.boot.kernelPackages.nvidiaPackages.legacy_390;
    #forceFullCompositionPipeline = true;
    prime = {
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
      sync.enable = true;
    };
  };
  nixpkgs.config.nvidia.acceptLicense = true;
  # nixpkgs.config.cudaSupport = true;
}
