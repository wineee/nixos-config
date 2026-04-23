{
  config,
  lib,
  pkgs,
  ...
}:
let
  python-with-my-packages = pkgs.callPackage ./python.nix { };
in
{
  environment.systemPackages =
    with pkgs;
    [
      bibata-cursors
      capitaine-cursors
      papirus-nord
      
      gnome-tweaks
      ## for develop
      vscode

      clang-tools
      cmake
      gcc
      gdb
      binutils
      clang
      cargo # rustfmt clippy rust-analyzer
      go
      nil
      neocmakelsp
      python-with-my-packages

      ## For nix
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

      # ai
      gemini-cli

      ## cli tools
      #act
      unrar
      wget
      man
      fastfetch
      yazi
      file
      coreutils
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
      appimage-run
      distrobox

      pineapple-pictures
      copyq
      telegram-desktop
      qq
      # zeal
      # vlc
      snapshot
      showtime
      # obs-studio
      # Browser
      firefox
      vivaldi
      # aria
      # jamesdsp
      gammaray
      hotspot
      # localsend
      remmina
      d-spy
      nomacs-qt6
      kdePackages.kdialog
      # deskflow
      contour
      vicinae
      rofi
    ]
    ++ (with pkgs.nur.repos; [
      rewine.wlhax
      rewine.wldbg
      rewine.wayland-debug
      rewine.git-commit-helper
    ]);
}
