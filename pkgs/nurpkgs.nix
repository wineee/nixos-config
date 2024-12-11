{ pkgs, ... }:
with pkgs;
let
  nurpkgs = with pkgs.nur.repos; [
    linyinfeng.wemeet
    rewine.ttf-wps-fonts
    rewine.wlhax
    rewine.wldbg
    rewine.xcursor-viewer
  ];
in
nurpkgs
