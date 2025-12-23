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
      ## for develop
      #qtcreator
      vscode

      clang-tools
      cmake
      gcc
      gdb
      binutils
      clang
      cargo # rustfmt clippy rust-analyzer
      cppcheck
      go
      gopls
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
      #aider-chat
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
      zellij
      appimage-run
      distrobox

      pineapple-pictures
      copyq
      telegram-desktop
      # cinny-desktop
      qq
      # zeal
      # vlc
      snapshot
      showtime
      # obs-studio
      flameshot
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
      # deskflow
      contour
      warp-terminal
      typora
      vicinae
      rofi
    ]
    ++ (with pkgs.nur.repos; [
      rewine.wlhax
      rewine.wldbg
      #rewine.xcursor-viewer
      rewine.wayland-debug
      rewine.git-commit-helper
    ]);
}
