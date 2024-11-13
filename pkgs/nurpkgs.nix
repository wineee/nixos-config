{ pkgs, ... }:
with pkgs;
let
  nurpkgs = with pkgs.nur.repos; [
    linyinfeng.wemeet
    # xddxdd.bilibili
    rewine.electron-netease-cloud-music
    rewine.ttf-wps-fonts
  ];
in
nurpkgs
