{ config, lib, pkgs, ... }:
let
  python-with-my-packages = pkgs.callPackage ./python.nix { };
  mynurpkgs = import ./nurpkgs.nix  { inherit pkgs; };

  build-tools = with pkgs; [
    cmake gcc gdb
    binutils
    clang-tools
    ninja
    qtcreator
    clang
    cargo rustfmt clippy rust-analyzer
    cppcheck
    # clazy
    go gopls
    goreleaser
    #lua5_3 ghc
    nodePackages.pnpm
    nil
    neocmakelsp
    vala-language-server
    uncrustify
    vala-lint
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
    nix-index
    nixfmt-rfc-style
    nvd
    nh
    comma
    manix
    devenv
  ];

  gui-tools = with pkgs; [
    kdePackages.okular
    tdesktop
    element-desktop
    # qq
    # wechat-uos
    zeal
    vlc  
    #obs-studio 
    simplescreenrecorder
    flameshot
    # Browser
    firefox
    vivaldi
    aria
    # rustdesk
    blackbox-terminal
    # jamesdsp
    # gammaray
    hotspot
    # localsend
    moonlight-qt
    remmina
    # wpsoffice-cn
    libreoffice-qt6
    d-spy
    nomacs-qt6
  ];

  modern-unix = with pkgs; [
    file
    coreutils
    topgrade
    miller
    fd
    htop
    ripgrep
    ugrep
    eza
    bat
    wl-clipboard
    wlr-randr
    duf
    tldr
    ncdu
    libtree
    pstree
    cloc
    gh
    axel
    # nvtopPackages.full
    atuin
    mise
    gping
    procs
    zellij
  ];
in
{
  environment.systemPackages =
    mynurpkgs
    ++ nixpkgs-tools
    ++ gui-tools
    ++ modern-unix
    ++ build-tools
    ++ (with pkgs; [
      sway
      wayfire
      greetd.regreet
      proxychains
      act

      #rofi
      rofi-calc
      rofi-emoji
      rofi-systemd
      alacritty

      pineapple-pictures
      copyq #albert
      unrar
      brightnessctl # 屏幕亮度 
      
      xorg.xmodmap

      wget
      man
      stow
      fastfetch
      yazi

      emacs
      # for emacs
      nodejs
      wmctrl
      aria
      xdotool

      vscode
      python-with-my-packages

      # AppImage  
      appimage-run
      #lutris winePackages.unstable winetricks
      distrobox
    ]);
}
