{ config, pkgs, ... }:
let
  #vivaldi-with-ffmpeg = pkgs.vivaldi.override {
  #  proprietaryCodecs = true;
  #  vivaldi-ffmpeg-codecs = pkgs.vivaldi-ffmpeg-codecs;
  #  enableWidevine = true;
  #  vivaldi-widevine = pkgs.vivaldi-widevine;
  #};
  python-with-my-packages = pkgs.callPackage ./etc/python.nix {};
  vscodium-with-extensions = pkgs.callPackage ./etc/vscodium.nix {};
in
{
  imports =
    [
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
      nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
        inherit pkgs;
      };
      vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; }; 
    };
  };  

  nixpkgs.config.vivaldi.proprietaryCodecs = true;

  environment.systemPackages = with pkgs; [
    alacritty dmenu picom nitrogen xmobar betterlockscreen albert xclip
    libxfs xfsprogs 
    wget tmux fzf man
    bpytop
    neofetch htop  
    lazygit  ranger
    netease-music-tui 
    vlc obs-studio 

    kdenlive
    gwenview
    ark latte-dock

    okular libreoffice typora 
    
    # text 
    neovim  
    emacs 
    zeal
    # for eaf
    git nodejs wmctrl aria xdotool
    nodePackages.npm 
    
    # code
    gcc gdb clang clang-tools cmake ninja 
    qtcreator libsForQt5.qt5.qtdoc libsForQt5.qt5.qtbase libsForQt5.qt5.qttools
    python-with-my-packages
    lua5_3 ghc  go 
    jdk jetbrains.idea-community

    vscode postman
    
    # network    
    v2ray qv2ray
    # Browser
    firefox 
    vivaldi-ffmpeg-codecs vivaldi-widevine
    vivaldi
    # AppImage  
    appimage-run
    # kvm
    qemu qemu_kvm virt-manager iproute
    vscodium-with-extensions
  ]; 
}

