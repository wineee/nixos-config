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
        inputs.dde-nixos.packages.${system}.dde-am
        inputs.dde-nixos.packages.${system}.dde-session
      ];
      systemd.packages = [
        inputs.dde-nixos.packages.${system}.dde-am
        inputs.dde-nixos.packages.${system}.dde-session
      ];
    }

  ] ++ (with inputs; [
    # agenix.nixosModule
    # grub2-themes.nixosModules
    home-manager.nixosModules.home-manager
    nixos-cn.nixosModules.nixos-cn-registries
    nixos-cn.nixosModules.nixos-cn
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
