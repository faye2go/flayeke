{ 
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./hyprland/hyprland.nix
    ./programs/kitty.nix
    ./programs/mako.nix
    ./programs/ranger.nix
    ./programs/swaylock.nix
    ./programs/waybar.nix
    ./programs/wlogout.nix
    ./programs/wofi.nix
    ./programs/zsh.nix
  ];
}