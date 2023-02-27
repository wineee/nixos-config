{ pkgs, ... }:
with pkgs;
let
  nurpkgs = with pkgs.nur.repos; [
    linyinfeng.wemeet
    # xddxdd.bilibili
    rewine.electron-netease-cloud-music
    # rewine.landrop
    xddxdd.wechat-uos
  ];
  nixcnpkgs = with nixos-cn; [
  ];
in
nurpkgs ++ nixcnpkgs
