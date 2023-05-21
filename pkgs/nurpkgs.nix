{ pkgs, ... }:
with pkgs;
let
  nurpkgs = with pkgs.nur.repos; [
    linyinfeng.wemeet
    # xddxdd.bilibili
    rewine.electron-netease-cloud-music
    # rewine.landrop
    rewine.ttf-wps-fonts
    xddxdd.wechat-uos
  ];
  nixcnpkgs = with nixos-cn; [
    # netease-cloud-music
  ];
in
nurpkgs ++ nixcnpkgs
