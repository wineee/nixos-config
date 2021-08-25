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
      
      ./etc/alias.nix
      ./etc/zsh.nix
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


  environment.systemPackages = with pkgs; [
    alacritty dmenu picom nitrogen xmobar
    betterlockscreen albert xclip
    pamixer # 音量控制
    brightnessctl # 屏幕亮度 
    scrot
  
    wget tmux fzf man
    # bpytop
    neofetch htop  
    ranger
    netease-music-tui 
    vlc # obs-studio 

    gwenview
    ark latte-dock

    okular libreoffice typora 
    # modern unix
    tldr exa fd  
    # text 
    neovim  
    emacs 
    yi
    
    # text 
    neovim  
    emacs 
    
    # for eaf
    git nodejs wmctrl aria xdotool
    
    # code
    gcc gdb clang clang-tools cmake ninja 
    #qtcreator 
    python-with-my-packages
    #lua5_3 ghc  go 
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
    vscodium-with-extensions
  ]; 
}

