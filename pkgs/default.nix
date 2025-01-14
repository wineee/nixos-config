{ config, lib, pkgs, ... }:
let
  python-with-my-packages = pkgs.callPackage ./python.nix { };
  vscodium-with-extensions = pkgs.callPackage ./vscodium.nix { };
  mynurpkgs = import ./nurpkgs.nix  { inherit pkgs; };

  build-tools = with pkgs; [
    xsettingsd
    cmake gcc gdb
    binutils
    clang-tools
    ninja
    # qtcreator
    clang
    cargo rustfmt clippy
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

    logseq
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
    # jamesdsp
    gammaray
    hotspot
    localsend
    moonlight-qt
    remmina
    wpsoffice-cn
    d-spy
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
    nvtop
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
    ++ qt5-libs
    ++ gui-tools
    ++ modern-unix
    ++ build-tools
    ++ (with pkgs; [
      greetd.regreet
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

      wget
      man
      stow
      fastfetch
      onefetch
      #ranger
      yazi

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
