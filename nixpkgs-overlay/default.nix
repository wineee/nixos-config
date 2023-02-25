self: super:
rec {
    wlroots = super.wlroots_0_16;
    
    wayfireApplications = wayfireApplications-unwrapped.withPlugins (plugins: [ plugins.wf-shell plugins.wayfire-plugins-extra.nix ]); # plugins.wf-info plugins.wayfire-plugin_dbus_interface
    inherit (wayfireApplications) wayfire wcm ;
    wayfireApplications-unwrapped = super.recurseIntoAttrs (
      super.callPackage ./pkgs/applications/window-managers/wayfire/applications.nix { }
    );
    
    wayfirePlugins = super.recurseIntoAttrs (
        super.callPackage ./pkgs/applications/window-managers/wayfire/plugins.nix {
        inherit (wayfireApplications-unwrapped) wayfire;
    });
}
