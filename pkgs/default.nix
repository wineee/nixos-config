{ config, lib, pkgs, ... }:
let
  python-with-my-packages = pkgs.callPackage ./python.nix { };
  mynurpkgs = import ./nurpkgs.nix  { inherit pkgs; };

  build-tools = with pkgs; [
    qtcreator
    code-cursor
    emacs-pgtk
    vscode

    clang-tools
    cmake gcc gdb
    binutils
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
    #vala-language-server
    uncrustify
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
    qq
    wechat-uos
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
    # jamesdsp
    gammaray
    hotspot
    # localsend
    remmina
    wpsoffice-cn
    d-spy
    nomacs-qt6
    warp-terminal
    kdePackages.kdialog
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
    aider-chat
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
      cage

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

      python-with-my-packages

      # AppImage  
      appimage-run
      #lutris winePackages.unstable winetricks
      distrobox
    ]);
}
