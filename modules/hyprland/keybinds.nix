{
  pkgs,
  lib,
  ...
}: {

    home.packages = [
    (import ./scripts/screenshot.nix {inherit pkgs;})
    (import ./scripts/waybar-relaunch.nix {inherit pkgs;})
    (import ./scripts/toggle-bluetooth.nix {inherit pkgs;})
    # (import ./scripts/wallpaper.nix {inherit pkgs;})
  ];

    wayland.windowManager.hyprland.settings = {

      "$mainMod" = "SUPER";

      bind = [
        # mainMod + q -> start default terminal
        "$mainMod, Q, exec, $terminal"
        # mainMod + e -> start default filemanager
        "$mainMod, E, exec, $fileManager"
        # mainMod + r -> start default program menu
        "$mainMod, R, exec, $menu"
        # mainMod + c -> kill focused window
        "$mainMod, C, killactive,"
        # mainMod + v -> toggle to floating windows (the thing you're used to)
        "$mainMod, V, togglefloating,"
        # mainMod + p -> small window i guess?
        "$mainMod, P, pseudo,"
        # mainMod + j -> toggle between horizontal and vertical split on focused window
        "$mainMod, J, togglesplit,"
        # mainMod + n -> toggle swaync panel 
        "$mainMod, N, exec, swaync-client -t"
        # mainMod + m -> wlogout screen
        "$mainMod, M, exec, wlogout"

        # mainMod + arrow keys -> move your focus
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"

        # mainMod + shift + arrow keys -> move focused window
        "$mainMod SHIFT, left, movewindow, l"
        "$mainMod SHIFT, right, movewindow, r"
        "$mainMod SHIFT, up, movewindow, u"
        "$mainMod SHIFT, down, movewindow, d"

        # mainMod + number -> switch workspace (0 -> 10)
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        # mainMod + ctrl + number -> switch workspace with focused window (0 -> 10)
        "$mainMod CTRL, 1, movetoworkspace, 1"
        "$mainMod CTRL, 2, movetoworkspace, 2"
        "$mainMod CTRL, 3, movetoworkspace, 3"
        "$mainMod CTRL, 4, movetoworkspace, 4"
        "$mainMod CTRL, 5, movetoworkspace, 5"
        "$mainMod CTRL, 6, movetoworkspace, 6"
        "$mainMod CTRL, 7, movetoworkspace, 7"
        "$mainMod CTRL, 8, movetoworkspace, 8"
        "$mainMod CTRL, 9, movetoworkspace, 9"
        "$mainMod CTRL, 0, movetoworkspace, 0"

        # mainMod + shift + number -> send focused window to workspace (0 -> 10)
        "$mainMod SHIFT, 1, movetoworkspacesilent, 1"
        "$mainMod SHIFT, 2, movetoworkspacesilent, 2"
        "$mainMod SHIFT, 3, movetoworkspacesilent, 3"
        "$mainMod SHIFT, 4, movetoworkspacesilent, 4"
        "$mainMod SHIFT, 5, movetoworkspacesilent, 5"
        "$mainMod SHIFT, 6, movetoworkspacesilent, 6"
        "$mainMod SHIFT, 7, movetoworkspacesilent, 7"
        "$mainMod SHIFT, 8, movetoworkspacesilent, 8"
        "$mainMod SHIFT, 9, movetoworkspacesilent, 9"
        "$mainMod SHIFT, 0, movetoworkspacesilent, 10"

        # special workspace 
        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod CTRL, S, movetoworkspace, special:magic"

        # mainMod + CTRL + down/up -> switch workspace relatively
        "$mainMod CTRL, down, workspace, e+1"
        "$mainMod CTRL, up, workspace, e-1"

        # custom

        # print -> screenshot in clipboard
        ", Print, exec, screenshot"
        # mainMod + L -> restart waybar
        "$mainMod, L, exec, wbRelaunch"
        # mainMod + shift + w -> change wallpaper randomly
        # "$mainMod, W, exec, changeWallpaper"
      ];

      bindm = [
        # Move/resize windows with mainMod + LMB/RMB and dragging
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      bindl = [
        # media keys

        # F1 -> mute output
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        # F2 -> decrease output volume by 5%
        ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
        # F3 -> increase output volume by 5%
        ", XF86AudioLowerVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%-"
        # F4 -> mute input
        ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"

        # F5 -> brightness up
        ", XF86MonBrightnessUp, exec, brightnessctl set 5%+"
        # F6 -> brightness down
        ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
        # F7 -> ?
        #", XF86Display, exec,"
        # F8 -> ?
        #", XF86WLAN, exec,"

        # F9 -> ?
        # ", XF86Tools, exec,"
        # F10 -> ?
        ", XF86Bluetooth, exec, toggleBluetooth"
        #11 -> ?
        # ", XF86Keyboard, exec,"
        #12 -> ?
        # ", XF86Favorites, exec,"

        # playerctrl stuff it's just what you're used to
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPrev, exec, playerctl previous"  
        ", XF86AudioStop, exec, playerctl stop"
      ];
    };
  }