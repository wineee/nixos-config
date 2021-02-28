{ config, ...}:

{
  environment.shellAliases = {
    v = "vi";
    vi = "nvim";
    vim = "emacs -nw";
  };
}
