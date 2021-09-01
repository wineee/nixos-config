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
      plugins = [ "git" "python" "man" ];
    };
  };
  environment.shells = [ pkgs.bashInteractive pkgs.zsh ];
  programs.thefuck.enable = true;
}
