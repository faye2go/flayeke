{
  pkgs,
}:

pkgs.writeShellScriptBin "waybarRelaunch" ''
  pkill ${pkgs.waybar}/bin/waybar

  ${pkgs.waybar}/bin/waybar &
''
