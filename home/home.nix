{ inputs, system, config, pkgs, ... }:
{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "rewine";
  home.homeDirectory = "/home/rewine";

  home.packages = with pkgs; [
    hugo
    cachix
    just
    xmake

    dconf-editor

    python3Packages.osc

    # wayland
    foot
    wlrctl
    wayout
    wayland-utils
    way-displays
    wdisplays
    jay

    # ai
    goose
  ];

  programs.git = {
    enable = true;
    userName = "rewine";
    userEmail = "luhongxu@deepin.org";
    delta.enable = true;
    lfs.enable = false;
    signing = {
      key = null;
      #signByDefault = true;
    };
    aliases = {
      co = "checkout";
      ci = "commit";
      cia = "commit --amend";
      s = "status";
      st = "status";
      b = "branch";
      p = "pull --rebase";
      pu = "push";
      d = "diff";
    };
    extraConfig = {
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
      core.compression = 0;
      http.postBuffer = 1048576000;
      protocol."https".allow = "always";
      url."https://github.com/".insteadOf = [ "gh:" "github:" ];
    };
  };

  programs = {
    neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
      coc.enable = true;
      plugins = with pkgs.vimPlugins; [
        fugitive
        vim-nix
        {
          plugin = vim-startify;
          config = "let g:startify_change_to_vcs_root = 0";
        }
      ];
      extraConfig = ''
        set whichwrap+=<,>,[,],h,l
      '';
    };
  };

  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  programs.gpg.enable = true;
  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 1800;
    enableSshSupport = true;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.shellAliases = {
    g = "git";
    "..." = "cd ../..";
  };

  home.stateVersion = "24.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
