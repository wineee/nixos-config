{ config, pkgs,  lib, modulesPath, inputs, ... }:
let
  python-with-my-packages = pkgs.callPackage ./etc/python.nix {};
  vscodium-with-extensions = pkgs.callPackage ./etc/vscodium.nix {};
in
{
  imports =
    [
      ./hardware-configuration.nix
      ./system
      
      #./systemd

      ./pkgs
      
      ./etc/alias.nix
      ./etc/zsh.nix
      #./etc/haskell.nix
    ];

  nix = {
    package = pkgs.nixUnstable;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  nixpkgs.config = {
    allowUnfree = true;

    vivaldi = {
      proprietaryCodecs = true;
      enableWideVine = true;
    };
    vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; }; 
  };

  environment.variables = {
    QT_QPA_PLATFORM_PLUGIN_PATH = "${pkgs.qt5.qtbase.bin.outPath}/lib/qt-${pkgs.qt5.qtbase.version}/plugins";
  };


  programs = {
    neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      defaultEditor = true;
      configure = {
        packages.myVimPackage = with pkgs.vimPlugins; {
          # loaded on launch
          start = [ fugitive vim-nix ];
          # manually loadable by calling `:packadd $plugin-name`
          opt = [  ];
        };
        customRC = ''
          set whichwrap+=<,>,[,],h,l
        '';
      };

    };
  };

  #nixpkgs.overlays = [
  #  (import (builtins.fetchGit {
  #    url = "https://github.com/nix-community/emacs-overlay.git";
  #    ref = "master";
  #    rev = "043268ac469364214a02918717d74d9a0cc1af3d"; # change the revision
  #  }))
  #];

  programs.git = {
    enable = true;
    config = {
      init.defaultBranch = "master";
      core.compression = 0;
      http.postBuffer = 1048576000;
      protocol."https".allow = "always";
    };
  };

  services.emacs = {
    install = true;
    enable = true;
    package = pkgs.emacs;
    # defaultEditor = true;
  };

  services.gnome.gnome-keyring.enable = true;
  #programs.tmux.keyMode = emacs;
}



