{
  description = "nixos-config";

  inputs = {
    nixos.url = "nixpkgs/nixos-unstable";
    nixlib.url = "github:nix-community/nixpkgs.lib";

    
    flake-utils.url = "github:numtide/flake-utils";

    home.url = "github:nix-community/home-manager";
    home.inputs.nixpkgs.follows = "nixos";
    
    digga.url = "github:divnix/digga";
    digga.inputs.nixpkgs.follows = "nixos";
    digga.inputs.nixlib.follows = "nixlib";
    digga.inputs.home-manager.follows = "home";
    #digga.inputs.deploy.follows = "deploy";

    nixos-cn.url = "github:nixos-cn/flakes";
    nixos-cn.inputs.nixpkgs.follows = "nixos";

    nur.url = "github:nix-community/NUR";

    rew.url = "github:wineee/rew-flakes";
    rew.inputs.nixpkgs.follows = "nixos";
  };

  outputs = 
  { self
  , nixos
  , flake-utils
  , nixos-cn
  , nur
  , rew
  , home
  , digga
  , ... } @ inputs:
  let
    system = "x86_64-linux";
    fup = digga.inputs.flake-utils-plus;
    supportedSystems = [ fup.lib.system.x86_64-linux ];
  in
  digga.lib.mkFlake {
    inherit self inputs supportedSystems;

    lib = import ./lib { lib = digga.lib // nixos.lib; };

    channelsConfig = { 
      allowUnfree = true;
      permittedInsecurePackages = [ "electron-9.4.4" ];
    };

    channels = {
      nixpkgs = {
        imports = [ (digga.lib.importOverlays ./overlays) ];
        overlays = [
          nur.overlay
          #  nvfetcher.overlay
          #./pkgs/default.nix
        ];
      };
    };

    sharedOverlays = import ./overlays/shared inputs;

    nixos = {
      hostDefaults = {
        system = "x86_64-linux";
        channelName = "nixos";
        imports = [ (digga.lib.importExportableModules ./modules) ];
        modules = [
          { lib.our = self.lib; }
          digga.nixosModules.bootstrapIso
          digga.nixosModules.nixConfig
          home.nixosModules.home-manager
          nixos-cn.nixosModules.nixos-cn-registries
          nixos-cn.nixosModules.nixos-cn
          rew.nixosModules.v2raya

          ({ pkgs, config, ... }: {
            config.services.v2raya.enable = true;
          })

          ./configuration.nix
        ];
        specialArgs = { inherit inputs; };
      };

      importables = rec {
        profiles = digga.lib.rakeLeaves ./profiles // {
          users = digga.lib.rakeLeaves ./users;
        };
        suites = with profiles; rec {
          base = [ core users.nixos users.root ];
          laptop = base ++ [ graphical.i3 mandb users.drpyser tmux ];
          server = base ++ [ mandb tmux sshd ];
        };
      };
    };
  };
}

