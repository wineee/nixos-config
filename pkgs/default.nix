{ config, lib, pkgs, ... }:
let
  python-with-my-packages = pkgs.callPackage ./python.nix { };
  vscodium-with-extensions = pkgs.callPackage ./vscodium.nix { };
  mynurpkgs = import ./nurpkgs.nix  { inherit pkgs; };

  build-tools = with pkgs; [
    xsettingsd
    cmake gcc gdb
    binutils
    #pkgsCross.aarch64-embedded.stdenv.cc
    #pkgsCross.riscv64.stdenv.cc pkgsCross.riscv64.binutils 
    clang-tools ninja qtcreator
    cargo
    nodePackages.pnpm
  ];

  nixpkgs-tools = with pkgs; [
    nixpkgs-fmt
    nixpkgs-lint
    nixpkgs-review
    nixpkgs-pytools
    nix-du
    nix-tree
    nix-update
    nix-init
    nixos-shell
    nvd
    comma
    manix
  ];

  qt5-libs = with pkgs.libsForQt5; [
    yakuake
    # kdenlive
    gwenview
    ark #latte-dock
  ];

  gui-tools = with pkgs; [
    okular
    wpsoffice-cn
    tdesktop
    element-desktop
    qq
    zeal

    logseq
    ghostwriter
    vlc  
    # obs-studio 
    simplescreenrecorder
    flameshot
    # Browser
    firefox
    vivaldi
    aria
    # rustdesk
    # libreoffice
    blackbox-terminal
  ];

  modern-unix = with pkgs; [
    file
    coreutils
    topgrade
    miller
  ];
in
{
  environment.systemPackages =
    mynurpkgs
    ++ nixpkgs-tools
    ++ qt5-libs
    ++ gui-tools
    ++ modern-unix
    ++ build-tools
    ++ (with pkgs; [
      proxychains
      act

      #rofi
      rofi-calc
      rofi-emoji
      rofi-systemd
      alacritty
      dmenu
##    picom
      nitrogen
      betterlockscreen
      xclip
      pineapple-pictures
      copyq #albert
      unrar
      pamixer # 音量控制
      brightnessctl # 屏幕亮度 
      scrot
      
      xorg.xmodmap
      # termonad

      wget
      tmux
      man
      stow
      hyfetch
      onefetch
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

      # AppImage  
      appimage-run
      #lutris winePackages.unstable winetricks

      distrobox
    ]);
}
