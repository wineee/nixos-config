{ config, lib, pkgs, ... }:

{
  programs = {
    neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      defaultEditor = true;
      configure = {
        packages.myVimPackage = with pkgs.vimPlugins; {
          # loaded on launch
          start = [ fugitive vim-nix ];
          # manually loadable by calling `:packadd $plugin-name`
          opt = [  ];
        };
        customRC = ''
          set whichwrap+=<,>,[,],h,l
        '';
      };

    };
  };
}
