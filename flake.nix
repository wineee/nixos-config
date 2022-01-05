{
  description = "nixos-config";     

  inputs.nixos.url = "github:NixOS/nixpkgs/nixos-unstable";                

  outputs = { self, nixos, ...}@inputs: {
    nixosConfigurations.nixos =  nixos.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./configuration.nix ];
        specialArgs = { inherit inputs; };
      };
  };
}

