{ config, ...}:

{
  environment.shellAliases = {
    v = "vi";
    vi = "nvim";
    vim = "emacs -nw";
    nix-zsh = "nix-shell --run zsh";
  };
}
