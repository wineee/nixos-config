{ config, ... }:

{
  environment.shellAliases = {
    ls = "exa --icons";
    l = "exa -l";
    ll = "exa -al";
    la = "exa -a";
    tree = "exa --tree";

    ":q" = "exit";
    c = "clear";
    ems = "emacs -nw";

    sgaa = "sudo git add";
    sgc = "sudo git commit";
    sgp = "sudo git push";
  };
}
