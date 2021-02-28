{ ... }:
{
   # keep a NixOS system up-to-date automatically
   system.autoUpgrade.enable = true;
   system.autoUpgrade.allowReboot = true;
   # system.autoUpgrade.channel = https://nixos.org/channels/nixos-20.09;
  
   nix.gc.automatic = true;
   nix.gc.dates = "05:15";   
}
