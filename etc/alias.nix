{ config, ...}:

{
  environment.shellAliases = {
    vi = "nvim";
    emo = "emacs -nw";
    nix-zsh = "nix-shell --run zsh";
    buildos = "sudo nixos-rebuild switch";
  };
}
