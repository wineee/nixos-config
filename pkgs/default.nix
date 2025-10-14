{ config, lib, pkgs, ... }:
let
  python-with-my-packages = pkgs.callPackage ./python.nix { };

  build-tools = with pkgs; [
    qtcreator
    code-cursor
    vscode

    clang-tools
    cmake gcc gdb
    binutils
    clang
    cargo #rustfmt clippy rust-analyzer
    cppcheck
    go gopls
    nil
    neocmakelsp
  ];

  nixpkgs-tools = with pkgs; [
    nixpkgs-review
    nixpkgs-pytools
    nix-du
    nix-tree
    nix-update
    nix-init
    # nixos-shell
    nix-index
    nixfmt-rfc-style
    nvd
    nh
    manix
    devenv
  ];

  gui-tools = with pkgs; [
    tdesktop
    element-desktop
    qq
    zeal
    vlc  
    obs-studio 
    #flameshot
    # Browser
    firefox
    vivaldi
    # aria
    # rustdesk
    # jamesdsp
    gammaray
    hotspot
    # localsend
    remmina
    wpsoffice-cn
    d-spy
    nomacs-qt6
    kdePackages.kdialog

    deskflow

    contour
    warp-terminal
    typora
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
    goreleaser
    atuin
    mise
    gping
    procs
    zellij
    # ai
    aider-chat
    gemini-cli
  ];
in
{
  environment.systemPackages =
    nixpkgs-tools
    ++ gui-tools
    ++ modern-unix
    ++ build-tools
    ++ (with pkgs; [
      act

      pineapple-pictures
      copyq #albert
      unrar

      wget
      man
      stow
      fastfetch
      yazi

      python-with-my-packages

      # AppImage  
      appimage-run
      distrobox

      pandoc
      rofi
    ])
    ++( with pkgs.nur.repos; [
      rewine.wlhax
      rewine.wldbg
      #rewine.xcursor-viewer
      rewine.wayland-debug
      rewine.git-commit-helper
  ]);
}
