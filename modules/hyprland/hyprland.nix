{
  pkgs,
  lib,
  config,
  ...
}: {

  imports = [
    ./keybinds.nix
  ];

  home.packages = [
    (import ./scripts/startup.nix {inherit pkgs;})
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    
    settings = with config.colorScheme.palette; {
      monitor = [
        # internal laptop monitor
        "eDP-1, 1920x1080, 0x0, 1"
        # external monitor
        "HDMI-A-2, 1920x1080, auto, 1"
        # drawing tablet
        "DP-1, 1920x1080, auto, 1"
      ];

      exec-once = "startup";

      "$terminal" = "kitty";
      "$fileManager" = "kitty ranger";
      "$menu" = "wofi --show drun";

      env = [
        "XCURSOR_SIZE,24"
        "QT_QPA_PLATFORMTHEME,qt6ct"
      ];

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
        gaps_out = 15;

        border_size = 3;
        "col.active_border" = "rgba(${base0E}ff) rgba(${base07}ff) 45deg";
        "col.inactive_border" = "rgba(${base00}aa)";
        
        layout = "dwindle";
      };

      decoration = {

        rounding = 10;

        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          blurls = [
            "waybar"
            "wofi"
            ];
        };

        active_opacity = "1.0";
        inactive_opacity = "0.9";
        fullscreen_opacity = "1.0";

        drop_shadow = true;
        shadow_range = 7;
        shadow_render_power = 3;

        "col.shadow" = "rgba(1a1a1aff)";
        "col.shadow_inactive" = "rgba(1a1a1a88)";
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
        new_status = "master";
      };

      gestures = {
        workspace_swipe = false;
      };

      windowrule = "suppressevent maximize class:.*";


    };
  };
}