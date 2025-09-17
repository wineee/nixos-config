{ inputs, system, ... }:
with inputs;
let
  nixosSystem = inputs.nixpkgs.lib.nixosSystem;

  sharedModules = [
    ../nixconfig.nix
    ../nixpkgsconfig.nix
    ../users.nix
  ] ++ (with inputs; [
    home-manager.nixosModules.home-manager
    linglong-flake.nixosModules.linyaps
    inputs.nix-index-database.nixosModules.nix-index
    { 
      programs.nix-index-database.comma.enable = true;
      programs.nix-index.enableBashIntegration = false;
      programs.nix-index.enableZshIntegration = false;

      services.linyaps.enable = true;
    }
  ]);

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
