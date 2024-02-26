{ ... }:
{
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    options = "caps:swapescape"; #"eurosign:e";
  };
}
