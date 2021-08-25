{ ... }:
{
   system.autoUpgrade.enable = false;  
   # system.autoUpgrade.allowReboot = true;
   # system.autoUpgrade.channel = https://nixos.org/channels/nixos-21.05;
  
   nix.gc.automatic = true;
   nix.gc.dates = "05:15";   
}
