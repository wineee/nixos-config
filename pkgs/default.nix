{ config, lib, pkgs, ... }:
let
  python-with-my-packages = pkgs.callPackage ./python.nix { };
  vscodium-with-extensions = pkgs.callPackage ./vscodium.nix { };

  nixpkgs-tools = with pkgs; [
    nixpkgs-fmt
    nixpkgs-lint
    nixpkgs-review
    nixpkgs-pytools
    nix-index
  ];

  qt5-libs = with pkgs.libsForQt5; [
    ark
    yakuake
    # kdenlive
    gwenview
    kdeconnect-kde
  ];

  gui-tools = with pkgs; [
    okular
    libreoffice
    tdesktop
    logseq
    ghostwriter
    vlc # obs-studio 
    simplescreenrecorder
    flameshot
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
    bat
    cloc
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
    ++ (with pkgs; [
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
      fzf
      man
      stow
      neofetch
      onefetch
      htop
      ranger

      gwenview
      ark #latte-dock
      nheko


      # for emacs
      nodejs
      wmctrl
      aria
      xdotool

      vscode
      gcc gdb 
      pkgsCross.riscv64-embedded.stdenv.cc
      pkgsCross.aarch64-embedded.stdenv.cc
      pkgsCross.riscv64.stdenv.cc
      #pkgsCross.aarch64-embedded.binutils
      #clang clang-tools cmake ninja 
      qt5Full qtcreator 
      python-with-my-packages
      #lua5_3  go cargo ghc
      #jdk jetbrains.idea-community

      # network    
      v2ray
      qv2ray
      clash
      # Browser
      firefox
      vivaldi

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
