{pkgs, ...}:
{
  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    #programs.zsh.shellAliases =  {
    #  vim='emaces -nw'
    #};
    ohMyZsh = {
      enable = true;
      theme = "peepcode";
      plugins = [ "git" "python" "man" "fzf"];
    };
  };
  environment.shells = [ pkgs.bashInteractive pkgs.zsh ];
}
