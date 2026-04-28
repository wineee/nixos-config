{ pkgs, lib, ... }:

{
  # services.dbus.enable = true;
  # services.notify-daemon.enable = true;
  # a DBus service that provides power management support to applications
  # services.upower.enable = true;
  # systemd.services.upower.enable = true;
  # use nmcil/nmtui to manager network 
  # programs.nm-applet.enable = true;
  # enable blueman to manager bluetooth
  # services.blueman.enable = true;

  #services.greetd = {
  #  enable = true;
  #  settings.default_session.command = "${pkgs.cage}/bin/cage -s -mlast -- regreet";
  #};
  #services.displayManager.cosmic-greeter.enable = true;

  #services.desktopManager.pantheon.enable = true;
  
  #services.xserver.enable = true;

  services = {
    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;
  };
}
