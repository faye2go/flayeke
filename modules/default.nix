{ 
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./hyprland/hyprland.nix
    ./programs/kitty.nix
    ./programs/mako.nix
    ./programs/waybar.nix
    ./programs/wofi.nix
    ./programs/zsh.nix
  ];
}