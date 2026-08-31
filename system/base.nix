{ config, lib, pkgs, ... }:

{
  # Set your time zone.
  time.timeZone = "Asia/Shanghai";

  #networking.hostId = "71452b6e"; # for zfs pool
  boot.supportedFilesystems = [ "xfs" "btrfs" "ntfs" ];

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    #alsa.support32Bit = true;
    #pulse.enable = true;
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };
  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # Enabling Bluetooth support
  hardware.bluetooth.enable = true;

  # set console font
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  services.gnome.gnome-keyring.enable = true;
  services.linyaps.enable = true;
  # environment.enableDebugInfo = true;
  # services.nixseparatedebuginfod2.enable = true;

  system.stateVersion = "22.11";
}
