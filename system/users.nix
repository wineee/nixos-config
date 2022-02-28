{ pkgs, ... }:
{
  users.users.rewine = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "libvirtd" "docker" "audio" "sound" "video" "input" "tty" "camera" "ssh" ];
  };
  users.defaultUserShell = pkgs.fish;

  security.sudo.extraRules = [
    {
      users = [ "rewine" ];
      commands = [
        {
          command = "ALL";
          options = [ "NOPASSWD" ];
        }
      ];
    }
  ];

  security.polkit = {
    enable = true;
    extraConfig = ''
       /* Log authorization checks. */
      polkit.addRule(function(action, subject) {
        polkit.log("user " +  subject.user + " is attempting action " + action.id + " from PID " + subject.pid);
      });
  
      /* Allow any local user to do anything (dangerous!). */
      polkit.addRule(function(action, subject) {
        if (subject.local) return "yes";
      });

    '';
  };

}
