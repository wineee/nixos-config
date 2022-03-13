{
  description = "nixos-config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixpkgs-master.url = "nixpkgs/master";
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
  };

  outputs = { self, nixpkgs, nixos-cn, nur, berberman, nixpkgs-master, ... }@inputs:
    let
      system = "x86_64-linux";

      pkgs' = import nixpkgs-master {
        inherit system;
        config.allowUnfree = true;
      };

    in
    {
      overlays = [
        berberman.overlay
      ];

      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          { nixpkgs.overlays = [ nur.overlay ]; }

          ({ pkgs, pkgs', ... }: {
            environment.systemPackages = [
              nixos-cn.legacyPackages.${system}.netease-cloud-music
              # pkgs'.sl
              # pkgs.nur.repos."0x4A6F".nixpkgs-check
              berberman.packages.x86_64-linux.feeluown
            ];

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

