{
  description = "nixos-config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    flake-utils-plus = {
      url = "github:gytis-ivaskevicius/flake-utils-plus";
      inputs.flake-utils.follows = "flake-utils";
    };
    nixos-cn = {
      url = "github:nixos-cn/flakes";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur.url = "github:nix-community/NUR";
    rew = {
      url = "github:wineee/rew-flakes";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs,  flake-utils, flake-utils-plus,
              nixos-cn, nur, rew, ... }@inputs:
    let
      system = "x86_64-linux";
    in
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          { nixpkgs.overlays = [ nur.overlay ]; }

          { nixpkgs.config.permittedInsecurePackages = [ "electron-9.4.4" ]; }

          ({ pkgs, config, ... }: {

            imports = [
              nixos-cn.nixosModules.nixos-cn-registries
              nixos-cn.nixosModules.nixos-cn
              rew.nixosModules.v2raya
            ];

            config.services.v2raya.enable = true;
          })

          ./configuration.nix
        ];
        specialArgs = { inherit inputs; };
      };
    };
}

