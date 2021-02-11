{pkgs, ... }:
{
 # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.rewine = {
    isNormalUser = true;
    useDefaultShell = true;
    extraGroups = [ "wheel" "networkmanager" "libvirtd"]; # Enable ‘sudo’ for the u>
  };
  users.defaultUserShell = pkgs.zsh;
}
