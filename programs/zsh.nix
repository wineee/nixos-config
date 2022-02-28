{ pkgs, config, ... }:
{
  #programs.fish.enable = true;  
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions = {
      enable = true;
      strategy = "match_prev_cmd"; # one of "history", "match_prev_cmd"
    };

    #programs.zsh.shellAliases =  {
    #  ems='emaces -nw'
    #};

    zsh-autoenv.enable = true;

    ohMyZsh = {
      enable = true;
      # theme = "peepcode";
      plugins = [
        "git" # many aliases 
        "python"
        "pip"
        "pipenv"
        "cp"
        "fd" # adds completion for the file search tool fd
        "man"
        "colored-man-pages"
        "z" # jump around
        "sudo" # 按两下ESC加上sudo
        "tmux" # aliases for tmux
      ];
      # after add p10k zsh is too slow
      customPkgs = [ pkgs.zsh-powerlevel10k ];
    };
    promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
  };

  environment.shells = [ pkgs.bashInteractive pkgs.zsh pkgs.fish ];

  programs.thefuck.enable = true;
  # TODO  
  # https://discourse.nixos.org/t/installing-home-manager-from-nixos/8248
}
