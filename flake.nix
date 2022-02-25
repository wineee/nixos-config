{
  description = "nixos-config";     

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";                
  inputs.nixos-cn = {
    url = "github:nixos-cn/flakes";
    inputs.nixpkgs.follows = "nixpkgs";
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
              
            nix.settings = {
              substituters = [
                "https://nixos-cn.cachix.org"
                "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
                "https://mirror.sjtu.edu.cn/nix-channels/store"
              ];
              trusted-public-keys = [ "nixos-cn.cachix.org-1:L0jEaL6w7kwQOPlLoCR3ADx+E3Q8SEFEcB9Jaibl0Xg=" ];
              trusted-users = [ "root" "rewine" ];
            };

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

