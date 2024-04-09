{
  pkgs,
}:

pkgs.writeShellScriptBin "startup" ''
  ${pkgs.swww}/bin/swww init &

  ${pkgs.swww}/bin/swww img ~/Pictures/Wallpapers/fayepurplelight.JPG

  ${pkgs.nm-applet}/bin/nm-applet --indicator &

  ${wl-clipboard}/bin/wl-paste -p --watch ${wl-clipboard}/bin/wl-copy -pc &

  ${pkgs.waybar}/bin/waybar &
  ${swaync}/bin/swaync &
''