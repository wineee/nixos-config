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
    inputs.nix-index-database.nixosModules.nix-index
    { 
      programs.nix-index-database.comma.enable = true;
      programs.nix-index.enableBashIntegration = false;
      programs.nix-index.enableZshIntegration = false;
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
