{ config, lib, pkgs, ... }:
let
  python-with-my-packages = pkgs.callPackage ./python.nix { };
  vscodium-with-extensions = pkgs.callPackage ./vscodium.nix { };
  mynurpkgs = import ./nurpkgs.nix  { inherit pkgs; };

  build-tools = with pkgs; [
    xsettingsd
    cmake gcc gdb
    binutils
    clang-tools ninja qtcreator
    clang
    cargo rustfmt clippy
    cppcheck
    clazy
    go
    #lua5_3 ghc
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
    ark
  ];

  gui-tools = with pkgs; [
    okular
    tdesktop
    element-desktop
    qq
    wechat-uos
    zeal

    #logseq
    ghostwriter
    vlc  
    #obs-studio 
    simplescreenrecorder
    flameshot
    # Browser
    firefox
    vivaldi
    aria
    # rustdesk
    # libreoffice
    blackbox-terminal
    jamesdsp
    gammaray
    hotspot
    localsend
    moonlight-qt
    remmina
    wpsoffice-cn
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
      dmenu-wayland

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

      emacs30
      # for emacs
      nodejs
      wmctrl
      aria
      xdotool

      vscode
      #jdk jetbrains.idea-community
      python-with-my-packages

      # AppImage  
      appimage-run
      #lutris winePackages.unstable winetricks

      distrobox
    ]);
}
