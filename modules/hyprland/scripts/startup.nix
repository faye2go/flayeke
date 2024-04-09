{
  pkgs,
}:

pkgs.writeShellScriptBin "startup" ''
  ${pkgs.swww}/bin/swww init &

  ${pkgs.swww}/bin/swww img ~/Pictures/Wallpapers/fayepurplelight.JPG

  ${pkgs.networkmanagerapplet}/bin/nm-applet --indicator &

  ${pkgs.wl-clipboard}/bin/wl-paste -p --watch ${pkgs.wl-clipboard}/bin/wl-copy -pc &

  ${pkgs.waybar}/bin/waybar &
  ${pkgs.swaynotificationcenter}/bin/swaync &
''