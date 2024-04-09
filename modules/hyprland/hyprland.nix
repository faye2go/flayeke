{
  pkgs,
  lib,
  config,
  ...
}: {

  imports = [
    ./keybinds.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    
    settings = {
      monitor = ",preferred,auto,1";

      exec-once = "bash ~/.config/hypr/scripts/startup.sh";

      env = [
        "XCURSOR_SIZE,24"
        "QT_QPA_PLATFORMTHEME,qt6ct"
      ];

      "$terminal" = "kitty";
      "$fileManager" = "dolphin";
      "$menu" = "wofi --show drun";

      input = {
        kb_layout = "de";

        follow_mouse = 1;

        touchpad = {
          natural_scroll = false;
        };

      sensitivity = 0;
      };

      general = {

        gaps_in = 5;
        gaps_out = 10;

        border_size = 3;
        "col.active_border" = "rgba(bb9af7ee) rgba(cbccd1ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";

        layout = "dwindle";
      };

      decoration = {

        rounding = 5;

        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          blurls = "waybar";
        };

        active_opacity = "1.0";
        inactive_opacity = "0.9";
        fullscreen_opacity = "1.0";

        drop_shadow = true;
        shadow_range = 10;
        shadow_render_power = 1;

        "col.shadow" = "rgba(1a1a1aff)";
        "col.shadow_inactive" = "rgba(1a1a1a33)";
      };

      animations = {
        enabled = true;

        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05;";

        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default, slidevert"
        ];
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        new_is_master = true;
      };

      gestures = {
        workspace_swipe = false;
      };

      windowrule = "suppressevent maximize class:.*";


    };
  };
}