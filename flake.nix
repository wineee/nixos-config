{
  description = "nixos-config";     

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";                
    nixos-cn = {
      url = "github:nixos-cn/flakes";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur.url = github:nix-community/NUR;
  };

  outputs = { self, nixpkgs, nixos-cn, nur, ...}@inputs:
    let system = "x86_64-linux";
    in {
      nixosConfigurations.nixos =  nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [ 
          { nixpkgs.overlays = [ nur.overlay ]; }
        
          ({ ... }: {
            environment.systemPackages = [
              nixos-cn.legacyPackages.${system}.netease-cloud-music 
            #  nur.repos.0x4A6F.nixpkgs-check
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

