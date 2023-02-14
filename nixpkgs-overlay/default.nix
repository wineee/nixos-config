self: super:

rec {
    wf-config = super.callPackage ./pkgs/applications/window-managers/wayfire/wf-config.nix { };
    
    wayfireApplications = wayfireApplications-unwrapped.withPlugins (plugins: [ plugins.wf-shell plugins.wayfire-plugins-extra plugins.wf-info ]); # plugins.wf-info plugins.wayfire-plugin_dbus_interface
    inherit (wayfireApplications) wayfire wcm ;
    wayfireApplications-unwrapped = super.recurseIntoAttrs (
        super.callPackage ./pkgs/applications/window-managers/wayfire/applications.nix { }
    );
    
    wayfirePlugins = super.recurseIntoAttrs (
        super.callPackage ./pkgs/applications/window-managers/wayfire/plugins.nix {
        inherit (wayfireApplications-unwrapped) wayfire;
    });
}
