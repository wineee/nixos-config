{ pkgs, ... }:
with pkgs;
let
  nurpkgs = with pkgs.nur.repos; [
    # linyinfeng.wemeet
    # xddxdd.bilibili
    rewine.electron-netease-cloud-music
    rewine.landrop
  ];
  nixcnpkgs = with nixos-cn; [
    wechat-uos
  ];
in
nurpkgs ++ nixcnpkgs
