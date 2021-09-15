{
  # package = pkgs.gitAndTools.gitFull;
  enable = true;
  userName = "rewine";
  userEmail = "1758075541@qq.com";
  aliases = {
    co = "checkout";
    ci = "commit";
    cia = "commit --amend";
    s = "status";
    st = "status";
    b = "branch";
    p = "pull --rebase";
    pu = "push";
  };
  ignores = [ "*~" "*.swp" ];
  extraConfig = {
    init.defaultBranch = "main";
    core.editor = "nvim";
    #protocol.keybase.allow = "always";
    credential.helper = "store --file ~/.git-credentials";
    pull.rebase = "false";
  };
}
