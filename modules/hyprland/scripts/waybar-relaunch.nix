{
  pkgs,
}:

pkgs.writeShellScriptBin "wbRelaunch" ''
  if pgrep waybar
  then  
  pkill waybar
  sleep 0.1
  fi
  
  ${pkgs.waybar}/bin/waybar &
''
