all: up h s

up:
    nix flake update
h:
    home-manager switch --flake . -I .
s:
    sudo nixos-rebuild switch --flake .#xiaomi -v -L
