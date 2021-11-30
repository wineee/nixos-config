{ config, lib, pkgs, ... }:

{
  # Set your time zone.
  time.timeZone = "Asia/Shanghai";

  boot.supportedFilesystems = ["xfs" "btrfs"];

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;
  
  # Enabling Bluetooth support
  hardware.bluetooth.enable = true;

  # set console font
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  # Enable Flatpak
  xdg.portal.enable = true;
  services.flatpak.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
 
 # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
  
  system.stateVersion = "22.05"; 
}
