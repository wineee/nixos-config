{
  description = "nixos-config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    #nixpkgs-master.url = "nixpkgs/master";
    flake-utils.url = "github:numtide/flake-utils";
    flake-utils-plus = {
      url = "github:gytis-ivaskevicius/flake-utils-plus";
      inputs.flake-utils.follows = "flake-utils";
    };
    nixos-cn = {
      url = "github:nixos-cn/flakes";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    berberman = {
      url = "github:berberman/flakes";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    rew = {
      url = "github:wineee/rew-flakes";
    };
    nix-dram = {
      url = "github:dramforever/nix-dram";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
    };
  };

  outputs = { self, nixpkgs,  flake-utils, flake-utils-plus,
              nixos-cn, nur, rew, berberman, nix-dram, ... }@inputs:
    let
      system = "x86_64-linux";

      #pkgs' = import nixpkgs-master {
      #  inherit system;
      #  config.allowUnfree = true;
      #};
    in
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          { nixpkgs.overlays = [ nur.overlay berberman.overlay nix-dram.overlay ]; }

          { nixpkgs.config.permittedInsecurePackages = [ "electron-9.4.4" ]; }

          ({ pkgs, ... }: {

            imports = [
              nixos-cn.nixosModules.nixos-cn-registries
              nixos-cn.nixosModules.nixos-cn
            ];
          })

          ./configuration.nix
        ];
        specialArgs = { inherit inputs; };
      };
    };
}

