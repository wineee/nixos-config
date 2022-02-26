{ config, ...}:

{
  environment.shellAliases = {
    ls = "exa --icons";
    l = "exa -l";
    ll = "exa -al";
    la = "exa -a";
    tree = "exa --tree";

    ":q" = "exit";
    c = "clear";
    r = "ranger";
    ems = "emacs -nw";
  
    nix-zsh = "nix-shell --run zsh";
    buildos = "sudo nixos-rebuild switch";

    sgaa = "sudo git add";
    sgc = "sudo git commit";
    sgp = "sudo git push";

  };
}
