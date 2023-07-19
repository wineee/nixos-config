self: super:
rec {
  wayfire = callPackage ../applications/window-managers/wayfire/default.nix {
    wlroots = super.wlroots_0_16;
  };
  wf-config = callPackage ../applications/window-managers/wayfire/wf-config.nix { };

  wayfirePlugins = recurseIntoAttrs (
    callPackage ../applications/window-managers/wayfire/plugins.nix { }
  );
  wayfire-with-plugins = callPackage ../applications/window-managers/wayfire/wrapper.nix {
    plugins = with wayfirePlugins; [ wcm wf-shell wayfire-plugins-extra ];
  };
}
