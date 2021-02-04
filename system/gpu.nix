{ lib, config, pkgs, ... }:
{ 
  services.xserver.videoDrivers = [ "modesetting" "vesa" "nv" ];
  services.xserver.useGlamor = true;
  # hardware.bumblebee.enable = true;

  # Enable OpenCL support for Intel Gen8 and later GPUs
  # nixpkgs.config.packageOverrides = pkgs: {
  #  vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
  # };

  hardware.opengl = {
    enable = true;  
    extraPackages = with pkgs; [
      intel-media-driver # LIBVA_DRIVER_NAME=iHD
      vaapiIntel         # LIBVA_DRIVER_NAME=i965 (older but works better for Firef>
      vaapiVdpau    
      libvdpau-va-gl
    ];
  };  

}
