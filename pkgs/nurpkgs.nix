{ pkgs, ... }:
with pkgs;
let
  nurpkgs = with pkgs.nur.repos; [
    linyinfeng.wemeet
    # xddxdd.bilibili
    rewine.electron-netease-cloud-music
    rewine.kylin-virtual-keyboard
    rewine.ttf-wps-fonts
    #xddxdd.wechat-uos
  ];
in
nurpkgs
