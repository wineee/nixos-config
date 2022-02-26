{
  description = "nixos-config";     

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";                
    nixos-cn = {
      url = "github:nixos-cn/flakes";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixos-cn, ...}@inputs:
    let system = "x86_64-linux";
    in {
      nixosConfigurations.nixos =  nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [ 
          ./configuration.nix
           ({ ... }: {
            environment.systemPackages =
              [ nixos-cn.legacyPackages.${system}.netease-cloud-music ];
              
            imports = [
              nixos-cn.nixosModules.nixos-cn-registries
              nixos-cn.nixosModules.nixos-cn
            ];
          })
        ];
        specialArgs = { inherit inputs; };
      };
    };
}

