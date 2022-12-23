{ inputs, system, ... }:
with inputs;
let
  nixosSystem = inputs.nixpkgs.lib.nixosSystem;

  sharedModules = [
    ../nixconfig.nix
    ../users.nix
    {
      environment.systemPackages = [
        #inputs.agenix.defaultPackage.x86_64-linux
        #inputs.taffybar.defaultPackage.${system}
      ];
    }
    { nixpkgs.overlays = [ nur.overlay ]; }
    ({ pkgs, config, ... }: {
        imports = [
          nixos-cn.nixosModules.nixos-cn-registries
          nixos-cn.nixosModules.nixos-cn
          dde-nixos.nixosModules.${system}
        ];
    })

  ] ++ (with inputs;[
    # agenix.nixosModule
    grub2-themes.nixosModule
    home-manager.nixosModules.home-manager
  ]) ++ (import ../modules );

in
{
  xiaomi = nixosSystem {
    inherit system;
    specialArgs = { inherit inputs system; };
    modules = (import ./xiaomi) ++ sharedModules;
  };
}
