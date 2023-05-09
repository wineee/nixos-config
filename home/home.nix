{ inputs, system, config, pkgs, ... }:
let
  polybarPkgs = with pkgs; [
    font-awesome          # awesome fonts
    material-design-icons # fonts with glyphs
    xfce.orage            # lightweight calendar
  ];
in
{
  imports = [
    ./polybar
  ];
  services.trayer.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "rewine";
  home.homeDirectory = "/home/rewine";

  home.packages =  polybarPkgs ++ (with pkgs; [
    # unix tools
    htop
    ugrep
    ripgrep
    fd
    libtree # ldd as a tree
    tldr
    duf
    ncdu
    pstree
    cloc
    colorpicker

    # nix tools
    nix-index
    nix-update
    nixfmt

    # other apps
    nodejs
    nodePackages.npm
    yarn
    hugo
    cachix

    ffmpeg
    gnome.dconf-editor
    dfeet

    python3Packages.osc
  ]);

  programs.git = {
    enable = true;
    userName = "rewine";
    userEmail = "lhongxu@outlook.com";
    delta.enable = true;
    lfs.enable = false;
    signing = {
      key = "0xAABB329787290824";
      signByDefault = true;
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

  programs.bat.enable = true;

  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.exa = {
    enable = true;
    enableAliases = true;
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

  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
