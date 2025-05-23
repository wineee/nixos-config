all: update home system

update:
    nix flake update
home:
    home-manager switch --flake . -I .
system:
    sudo nixos-rebuild switch --flake .#xiaomi -v -L
