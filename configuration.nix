# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:
let
  unstableTarball =
   fetchTarball
    https://nixos.org/channels/nixpkgs-unstable/nixexprs.tar.xz; 
    # https://github.com/NixOS/nixpkgs-channels/archive/nixos-unstable.tar.gz;
  extensions = (with pkgs.vscode-extensions; [
      bbenoist.Nix
      ms-python.python
      ms-azuretools.vscode-docker
    ]) ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
    {
      name = "remote-ssh-edit";
      publisher = "ms-vscode-remote";
      version = "0.47.2";
      sha256 = "1hp6gjh4xp2m1xlm1jsdzxw9d8frkiidhph6nvl24d0h8z34w49g";
    }
  ];
  vscodium-with-extensions = pkgs.vscode-with-extensions.override {
    vscode = pkgs.vscodium;
    vscodeExtensions = extensions;
  };

in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      
      ./sys
      ./sys/boot.nix
      ./sys/fonts.nix
      ./sys/gpu.nix
      ./sys/keyboard.nix
      ./sys/i18n.nix
      ./sys/desktop.nix
      ./sys/network.nix
      ./sys/users.nix
      ./sys/virtualisation.nix
      ./sys/auto.nix
      
      ./etc/alias.nix
      ./etc/zsh.nix
    ];

  nix.binaryCaches = [ "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store" ];

  nixpkgs.config = {
    allowUnfree = true;
    packageOverrides = pkgs: {
      unstable = import unstableTarball {
        config = config.nixpkgs.config;
      };
      nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
        inherit pkgs;
      };
      vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; }; 
    };
    nixpkgs.config.vivaldi = {
      proprietaryCodecs = true;
      enableWideVine = true;
    };
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    dmenu picom nitrogen xmobar betterlockscreen i3status 
    libxfs xfsprogs 
    wget git tmux fzf man
    bpytop
    neofetch htop  
    lazygit  ranger
    # unstable.netease-music-tui 
    vlc obs-studio 

    kdeApplications.kdenlive
    kdeApplications.gwenview
    kdeApplications.ark

    okular libreoffice typora #nur.picgo
    
    # text 
    neovim  nodePackages.coc-git
    emacs 
    # code
    gcc gdb clang clang-tools cmake ninja 
    qt5.full #qt5.qmake qt5.qtdoc qt5.qtsvg qt5.qtbase 
    #qt5.qtscxml qt5.qttools qt5.qtcharts qt5.qtwebkit qt5.qtspeech
    qtcreator
    python3Full # python38Packages.pip
    lua5_3 ghc nodejs
    jdk jetbrains.idea-community

    vscode postman vscodium-with-extensions
    
    # network    
    unstable.v2ray unstable.qv2ray
    # Browser
    firefox vivaldi vivaldi-ffmpeg-codecs #vivaldi-widevine
    # AppImage  
    appimage-run
    # kvm
    qemu qemu_kvm virt-manager iproute
  ];
  
  # List services that you want to enable:
}
