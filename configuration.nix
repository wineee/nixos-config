{ config, pkgs, ... }:
let
  python-with-my-packages = pkgs.callPackage ./etc/python.nix {};
  vscodium-with-extensions = pkgs.callPackage ./etc/vscodium.nix {};
in
{
  imports =
    [
      ./hardware-configuration.nix
      
      ./sys
      ./sys/boot.nix
      ./sys/fonts.nix
      ./sys/gpu.nix
      ./sys/keyboard.nix
      ./sys/i18n.nix
      ./sys/desktop.nix
      ./sys/network.nix
      ./sys/users.nix
      ./sys/virtualisation.nix
      ./sys/auto.nix
      
      ./systemd
      
      ./etc/alias.nix
      ./etc/zsh.nix
      ./etc/haskell.nix
    ];

  nix.binaryCaches = [ "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store" ];

  nixpkgs.config = {
    allowUnfree = true;

    vivaldi = {
      proprietaryCodecs = true;
      enableWideVine = true;
    };
    vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; }; 
  };
 
  environment.variables = {
    QT_QPA_PLATFORM_PLUGIN_PATH = "${pkgs.qt5.qtbase.bin.outPath}/lib/qt-${pkgs.qt5.qtbase.version}/plugins";
  };

  services.emacs.package = pkgs.emacsPgtkGcc;

  programs = {
    neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      defaultEditor = true;
      configure = {
        packages.myVimPackage = with pkgs.vimPlugins; {
          # loaded on launch
          start = [ fugitive vim-nix ];
          # manually loadable by calling `:packadd $plugin-name`
          opt = [  ];
        };
  };


    };
  };

  nixpkgs.overlays = [
    (import (builtins.fetchGit {
      url = "https://github.com/nix-community/emacs-overlay.git";
      ref = "master";
      rev = "bfc8f6edcb7bcf3cf24e4a7199b3f6fed96aaecf"; # change the revision
    }))
  ];

  services.gnome.gnome-keyring.enable = true;

  environment.systemPackages = with pkgs; [
    mailspring libsecret 
    dunst
    
    rofi rofi-calc rofi-emoji rofi-systemd
    trayer #https://www.youtube.com/watch?v=MyJjiYVggBs
    alacritty dmenu picom nitrogen xmobar
    betterlockscreen xclip copyq #albert
    pamixer # 音量控制
    brightnessctl # 屏幕亮度 
    scrot colorpicker xorg.xmodmap
    #nyxt
    wget tmux fzf man stow
    # bpytop
    neofetch htop  
    ranger
    # netease-music-tui 
    vlc # obs-studio 

    gwenview
    ark #latte-dock

    okular libreoffice #typora 
    tdesktop mu

    # modern unix
    duf tldr exa fd ripgrep ncdu pstree file
    coreutils # basic GNU utilities


    # text 
    neovim  
    #vscodium-with-extensions
    emacsPgtkGcc
    
    # for emacs
    git nodejs wmctrl aria xdotool
    tdlib

    # code
    gcc gdb clang clang-tools cmake ninja 
    #qtcreator 
    python-with-my-packages
    #lua5_3  go
    ghc
    #jdk jetbrains.idea-community

    vscode postman
    
    # network    
    v2ray qv2ray
    clash 
    # Browser
    firefox 
    vivaldi
    # AppImage  
    appimage-run
    # kvm
    qemu qemu_kvm virt-manager iproute
  ];


  #programs.tmux.keyMode = emacs;
  services.emacs.enable = true;
  #services.emacs.defaultEditor = true; 
}

