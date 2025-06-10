{ pkgs, config, ... }:
{
  environment.variables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  programs.fish.enable = true;  
  
  programs.zsh = {
    enable = false;
    enableCompletion = true;
    autosuggestions = {
      enable = true;
      strategy = [ "match_prev_cmd" ]; # one of "history", "match_prev_cmd"
    };
    zsh-autoenv.enable = true;
  };

  environment.shells = [ pkgs.fish pkgs.bashInteractive ];

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
