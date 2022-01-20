{
  description = "nixos-config";     

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";                

  outputs = { self, nixpkgs, ...}@inputs: {
    nixosConfigurations.nixos =  nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./configuration.nix ];
        specialArgs = { inherit inputs; };
      };
    };
}

