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
<<<<<<< HEAD
    vivaldi = {
      proprietaryCodecs = true;
      enableWideVine = true;
    };
=======
>>>>>>> 7f5db9b7f084e2873c5b077b77e4a2677f8c6e9a
    packageOverrides = pkgs: {
      nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
        inherit pkgs;
      };
      vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; }; 
    };
  };  

<<<<<<< HEAD
  #nixpkgs.config.vivaldi.proprietaryCodecs = true;
=======
  nixpkgs.config.vivaldi.proprietaryCodecs = true;
>>>>>>> 7f5db9b7f084e2873c5b077b77e4a2677f8c6e9a

  environment.systemPackages = with pkgs; [
    alacritty dmenu picom nitrogen xmobar
    betterlockscreen albert xclip
    pamixer # 音量控制
    brightnessctl # 屏幕亮度 
    scrot
  
    wget tmux fzf man
    # bpytop
    neofetch htop  
    ranger
    netease-music-tui 
    vlc # obs-studio 

    gwenview
    ark latte-dock

    okular libreoffice typora 
<<<<<<< HEAD
    # modern unix
    tldr exa fd  
    # text 
    neovim  
    emacs 
    yi
=======
    
    # text 
    neovim  
    emacs 
    
>>>>>>> 7f5db9b7f084e2873c5b077b77e4a2677f8c6e9a
    # for eaf
    git nodejs wmctrl aria xdotool
    
    # code
    gcc gdb clang clang-tools cmake ninja 
<<<<<<< HEAD
    #qtcreator 
    python-with-my-packages
    #lua5_3 ghc  go 
    #jdk jetbrains.idea-community
=======
    qtcreator 
    python-with-my-packages
    lua5_3 ghc  go 
    jdk jetbrains.idea-community
>>>>>>> 7f5db9b7f084e2873c5b077b77e4a2677f8c6e9a

    vscode postman
    
    # network    
    v2ray qv2ray
<<<<<<< HEAD
    clash 
=======
>>>>>>> 7f5db9b7f084e2873c5b077b77e4a2677f8c6e9a
    # Browser
    firefox 
    vivaldi
    # AppImage  
    appimage-run
    # kvm
    qemu qemu_kvm virt-manager iproute
    vscodium-with-extensions
  ]; 
}

