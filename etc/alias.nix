{ config, ...}:

{
  environment.shellAliases = {
    ls = "exa --icons";
    l = "exa -l";
    ll = "exa -al";
    la = "exa -a";
    tree = "exa --tree";

    c = "clear";
    r = "ranger";
    ems = "emacs -nw";
    
    nix-zsh = "nix-shell --run zsh";
    buildos = "sudo nixos-rebuild switch";
  };
}
