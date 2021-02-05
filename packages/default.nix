{ config,  pkgs, ... }:
let
  #import = ../nix/default.nix{ config, pkgs };

  packages = with pkgs; [
    dmenu picom nitrogen xmobar
   
    wget git zsh tmux fzf
 
    neofetch htop  
    lazygit  ranger
    unstable.netease-music-tui 
    vlc obs-studio

    kdeApplications.kdenlive
    kdeApplications.gwenview
    kdeApplications.ark

    okular libreoffice typora
    
    # text 
    neovim  nodePackages.coc-git
    emacs 
    # code
    gcc gdb clang cmake 
    qt5.full  
    python3 lua5_3 ghc 
    qtcreator
    jdk jetbrains.idea-community

    vscode postman
    
    # network    
    unstable.v2ray unstable.qv2ray
    # Browser
    firefox vivaldi vivaldi-ffmpeg-codecs #vivaldi-widevine
    # AppImage  
    appimage-run
    # kvm
    qemu qemu_kvm virt-manager iproute
  ];
in
packages
