{ config, ...}:

{
  environment.shellAliases = {
    l = "exa";
    ll = "exa -l";
    la = "exa -a";
    tree = "exa --tree";
    c = "clear";
    r = "ranger";
    vi = "nvim";
    ems = "emacs -nw";
    nix-zsh = "nix-shell --run zsh";
    buildos = "sudo nixos-rebuild switch";
  };
}
