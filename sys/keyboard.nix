{ ... }:
{
  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbOptions = "caps:swapescape"; #"eurosign:e";

  };
}
