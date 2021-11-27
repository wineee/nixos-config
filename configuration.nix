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

  nix = {
    package = pkgs.nixUnstable;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
   };
  nix.binaryCaches = [ "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store" ];
  nix.trustedUsers = [ "root" "rewine" ];

  nixpkgs.config = {
    allowUnfree = true;

    vivaldi = {
      proprietaryCodecs = true;
      enableWideVine = true;
    };
    vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; }; 
  };
 
  #environment.variables = {
  #  QT_QPA_PLATFORM_PLUGIN_PATH = "${pkgs.qt5.qtbase.bin.outPath}/lib/qt-${pkgs.qt5.qtbase.version}/plugins";
  #};

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
        customRC = ''
          set whichwrap+=<,>,[,],h,l
        '';
      };

    };
  };

  nixpkgs.overlays = [
    (import (builtins.fetchGit {
      url = "https://github.com/nix-community/emacs-overlay.git";
      ref = "master";
      rev = "15ecda897ac72e1d3812306847beb5b7b981fdd6"; # change the revision
    }))
  ];

  services.gnome.gnome-keyring.enable = true;

  environment.systemPackages = with pkgs; [
    proxychains # 给不听话的应用上代理
    mailspring libsecret 
    dunst
    # busybox     
    rofi rofi-calc rofi-emoji rofi-systemd
    trayer #https://www.youtube.com/watch?v=MyJjiYVggBs
    alacritty dmenu picom nitrogen xmobar
    betterlockscreen xclip copyq #albert
    unrar
    pamixer # 音量控制
    brightnessctl # 屏幕亮度 
    scrot colorpicker xorg.xmodmap
    #nyxt
    wget tmux fzf man stow
    # bpytop
    neofetch onefetch 
    htop  
    ranger
    # netease-music-tui 
    vlc # obs-studio 
    simplescreenrecorder
    
    gwenview
    ark #latte-dock

    okular libreoffice #typora 
    tdesktop logseq

    # modern unix
    duf tldr exa fd ripgrep ncdu pstree file
    
    coreutils # basic GNU utilities

    # text 
    neovim  
    emacsPgtkGcc
    
    # for emacs
    git nodejs wmctrl aria xdotool libudev0-shim
    tdlib
   
    vscode 
    
    # code
    gcc gdb clang clang-tools cmake ninja 
    qt5Full qtcreator 
    python-with-my-packages
    #lua5_3 
    go
    cargo
    ghc
    #jdk jetbrains.idea-community

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
  
    #lutris 
    winePackages.unstable winetricks
        
    # blog
    hugo
  
    cachix
    xbps
  ];


  #programs.tmux.keyMode = emacs;
  services.emacs.enable = true;
}

