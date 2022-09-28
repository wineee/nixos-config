{ pkgs, ... }:
with pkgs;
let
  nurpkgs = with pkgs.nur.repos; [
    # linyinfeng.wemeet
    linyinfeng.icalingua-plus-plus
    # xddxdd.bilibili
    rewine.electron-netease-cloud-music
    rewine.landrop
    rewine.v2raya
  ];
  nixcnpkgs = with nixos-cn; [
    wechat-uos
  ];
in
nurpkgs ++ nixcnpkgs
