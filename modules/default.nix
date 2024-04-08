{ 
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./hyprland/hyprland.nix
    ./programs/kitty.nix
  ];
}