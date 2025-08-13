{ pkgs, ... }:
with pkgs;
let
  nurpkgs = with pkgs.nur.repos; [
    #linyinfeng.wemeet
    rewine.wlhax
    rewine.wldbg
    rewine.xcursor-viewer
    rewine.wayland-debug
    rewine.git-commit-helper
  ];
in
nurpkgs
