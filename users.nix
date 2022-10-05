{ pkgs, ... }:
{
  users.users.rewine = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "libvirtd" "docker" "audio" "sound" "video" "input" "tty" "camera" "ssh" ];
    hashedPassword = "$6$tirLQpfL/10za93y$gi0gJOgVBRyKIOZ6xEYgpo1DClHKDn4CcbrY4BgWKKWOlsVAGxDE5x2JVbQ6WJBHRgyPsDBb/X1MVeEa.o4H41";
    # https://zhuanlan.zhihu.com/p/463397947
  };
  users.defaultUserShell = pkgs.fish;

  security.sudo.wheelNeedsPassword = false;

  security.polkit = {
    enable = true;
    extraConfig = ''
       /* Log authorization checks. */
      polkit.addRule(function(action, subject) {
        polkit.log("user " +  subject.user + " is attempting action " + action.id + " from PID " + subject.pid);
      });
    '';
  };

}
