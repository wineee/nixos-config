{ config, lib, pkgs, ... }:
let
  python-with-my-packages = pkgs.callPackage ./python.nix { };
  vscodium-with-extensions = pkgs.callPackage ./vscodium.nix { };

  build-tools = with pkgs; [
    cmake gcc gdb
    binutils
    
    #pkgsCross.aarch64-embedded.stdenv.cc
    #pkgsCross.riscv64.stdenv.cc
    #pkgsCross.riscv64.binutils
   
    #clang clang-tools ninja 
    qt5Full qtcreator 
  ];

  nixpkgs-tools = with pkgs; [
    nixpkgs-fmt
    nixpkgs-lint
    nixpkgs-review
    nixpkgs-pytools
    nix-index
    nix-du
    manix
    nix-direnv
    direnv
  ];

  qt5-libs = with pkgs.libsForQt5; [
    yakuake
    # kdenlive
    kdeconnect-kde
    gwenview
    ark #latte-dock
    lightly
  ];

  gui-tools = with pkgs; [
    okular
    wpsoffice-cn
    libreoffice
    tdesktop
    logseq
    ghostwriter
    vlc # obs-studio 
    simplescreenrecorder
    flameshot
    # Browser
    firefox
    vivaldi
    microsoft-edge-dev

    element-desktop
    ripes
    #rustdesk
  ];

  modern-unix = with pkgs; [
    duf
    tldr
    exa
    fd
    ripgrep
    ncdu
    pstree
    file
    coreutils
    #bat
    cloc
    topgrade
    # libtree
    miller
    delta
  ];
in
{
  environment.systemPackages =
    nixpkgs-tools
    ++ qt5-libs
    ++ gui-tools
    ++ modern-unix
    ++ build-tools
    ++ (with pkgs; [
      home-manager

      proxychains
      dunst

      rofi
      rofi-calc
      rofi-emoji
      rofi-systemd
      trayer #https://www.youtube.com/watch?v=MyJjiYVggBs
      alacritty
      dmenu
      picom
      nitrogen
      xmobar
      betterlockscreen
      xclip
      pineapple-pictures
      copyq #albert
      unrar
      pamixer # 音量控制
      brightnessctl # 屏幕亮度 
      scrot
      colorpicker
      xorg.xmodmap
      termonad

      wget
      tmux
      # fzf
      man
      stow
      neofetch
      onefetch
      # htop
      ranger

      # for emacs
      nodejs
      wmctrl
      aria
      xdotool

      vscode
      #lua5_3  go cargo ghc
      #jdk jetbrains.idea-community
      python-with-my-packages

      # network    
      v2ray
      qv2ray

      # AppImage  
      appimage-run

      # kvm
      qemu
      qemu_kvm
      virt-manager
      iproute
      #lutris winePackages.unstable winetricks
      
      # blog
      hugo

      cachix
    ]);
}
