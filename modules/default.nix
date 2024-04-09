{ 
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./hyprland/hyprland.nix
    ./programs/kitty.nix
    # ./programs/swaync.nix
    ./programs/waybar.nix
    ./programs/zsh.nix
  ];
}