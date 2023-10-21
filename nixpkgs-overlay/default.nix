self: super:
rec {
  #wayfire = self.callPackage pkgs/applications/window-managers/wayfire/default.nix {
  #  wlroots = super.wlroots_0_16;
  #};
  #wf-config = self.callPackage pkgs/applications/window-managers/wayfire/wf-config.nix { };

  #wayfirePlugins = super.recurseIntoAttrs (
  #  self.callPackage pkgs/applications/window-managers/wayfire/plugins.nix { }
  #);
  #wayfire-with-plugins = self.callPackage pkgs/applications/window-managers/wayfire/wrapper.nix {
  #  plugins = with wayfirePlugins; [ wcm wf-shell wayfire-plugins-extra ];
  #};
}
