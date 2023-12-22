{ inputs, system, ... }:
with inputs;
let
  nixosSystem = inputs.nixpkgs.lib.nixosSystem;

  sharedModules = [
    ../nixconfig.nix
    ../nixpkgsconfig.nix
    ../users.nix
    {
      environment.systemPackages = [
        #inputs.agenix.defaultPackage.x86_64-linux
      ];
      systemd.packages = [
      ];
    }

  ] ++ (with inputs; [
    # agenix.nixosModule
    grub2-themes.nixosModules.default
    home-manager.nixosModules.home-manager
    dde-nixos.nixosModules.${system}
  ]) ++ (import ../modules );

in
{
  xiaomi = nixosSystem {
    inherit system;
    specialArgs = { inherit inputs system; };
    modules = (import ./xiaomi) ++ sharedModules;
  };
  e500 = nixosSystem {
    inherit system;
    specialArgs = { inherit inputs system; };
    modules = (import ./e500) ++ sharedModules;
  };
}
