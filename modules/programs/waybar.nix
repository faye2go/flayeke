{
  pkgs,
  config,
  ...
}: let 
scheme = config.colorScheme.palette;
in {
  programs.waybar = {
    enable = true;
  settings = [{
    "layer" = "top";
    "position" = "top";
    "height" = 30;
    "spacing" = 15;
    "margin-left" = 10;
    "margin-top" = 10;
    "margin-right" = 10;
    "margin-bottom" = 0;

    "modules-left" = [
        "hyprland/workspaces"
        "group/system"
    ];
    "modules-center" = [
        "hyprland/window"
    ];
    "modules-right" = [
        "tray"
        "custom/swaync"
        "group/device"
        "clock"
    ];

    "hyprland/workspaces" = {
        "format" = "{id}";
    };
    "group/system" = {
        "orientation" = "inherit";
        "modules" = [
            "cpu"
            "memory"
            "temperature"
        ];
    };
    "cpu" = {
        "format" = "{usage}% ";
        "tooltip" = false;
    };
    "memory" = {
        "format" = "{}% ";
    };
    "temperature" = {
        "critical-threshold" = 80;
        "format-critical" = "{temperatureC}°C {icon}";
        "format" = "{temperatureC}°C {icon}";
        "format-icons" = ["" "" ""];
    };

    "hyprland/window" = {
        "format" = "{title}";
    };

    "tray" = {
        "spacing" = 10;
    };
    "custom/swaync" = {
        "format" = "bell";
        "on-click" = "swaync-client -t";
        "tooltip" = false;
    };
    "group/device" = {
        "orientation" = "inherit";
        "modules" = [
            "pulseaudio#out"
            "pulseaudio#in"
            "bluetooth"
            "network"
            "battery"
        ];
    };
    "pulseaudio#out" = {
        "format" = "{volume}% {icon}";
        "format-bluetooth" = "{volume}% {icon}";
        "format-bluetooth-muted" = " {icon}";
        "format-muted" = "";
        "format-icons" = {
            "headphone" = "";
            "hands-free" = "";
            "headset" = "";
            "phone" = "";
            "portable" = "";
            "car"= "";
            "default"= ["" "" ""];
        };
        "on-click" = "pavucontrol";
    };
    "pulseaudio#in" = {
        "format" = "{format_source}";
        "format-source" = "";
        "format-source-muted" = "";
    };
    "bluetooth" = {
        "format" = "";
        "format-connected" = " {num_connections}";
        "tooltip-format" = "no connection";
        "tooltip-format-connected" = "\n\n{device_enumerate}";
        "tooltip-format-enumerate-connected" = "{device_alias}";
    };
    "network" = {
        "format-wifi" = "";
        "format-ethernet" = "";
        "tooltip-format-wifi" = "{essid} ({signalStrength}%) {ifname} via {gwaddr}";
        "tooltip-format-ethernet" = "{ipaddr}/{cidr} {ifname} via {gwaddr}";
        "format-linked" = "";
        "tooltip-format-linked" = "{ifname} (No IP) {ifname} via {gwaddr";
        "format-disconnected"= "⚠";
        "on-click" = "nm-applet";
    };
    "battery" = {
        "states" = {
            "ok" = 79;
            "warning" = 30;
            "critical" = 15;
        };
        "format" = "{capacity}% {icon}";
        "format-full" = "{capacity}% {icon}";
        "format-charging" = "{capacity}% ";
        "format-plugged" = "{capacity}% ";
        "format-icons" = ["" "" "" "" ""];
    };
    "clock" = {
        "format" = "{:%a %Y-%m-%d, %H:%M}";
        "tooltip-format" = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        "format-alt" = "{:%H:%M}";
    };
  }];
  style = with config.colorScheme.palette; ''
  * {
    font-family: Material Design Icons, JetBrainsMono;
  }

  window#waybar {
      background-color: rgba(100, 100, 115, 0.3);
      color: #${base05};
      transition-property: background-color;
      transition-duration: 0.5s;
      border-radius: 5px;
    }

  #cpu,
  #memory,
  #disk,
  #temperature,
  #custom-media,
  #tray,
  #custom-swaync,
  #pulseaudio,
  #bluetooth,
  #network,
  #battery,
  #clock {
      font-size: 16px;
      border-radius: 5px;
      padding: 2px 6px;
      background-color: rgba(26, 27, 38, 0.7);
      margin-left: 3px;
      margin-right: 3px;

      margin-top: 5px;
      margin-bottom: 5px;
  }

  #workspaces {
      font-size: 16px;
      border-radius: 5px;
      padding: 2px 6px;
      background-color: rgba(26, 27, 38, 0.7);
      margin-left: 3px;
      margin-right: 3px;

      margin-top: 5px;
      margin-bottom: 5px;
  }

  #workspaces button {
      font-size: 12px;
      padding: 0 4px;
      color: #${base05};
      background-color: rgba(100, 100, 115, 0.5);
  }

  #workspaces button.active {
      background-color: #${base0D};
      color: #${base01};
  }

  #workspaces button:hover {
      color: #${base0E};
      background-color: #${base05};
  }

  #cpu {
      color: #${base0B};
  }

  #memory,
  #battery {
      color: #${base0E};
  }

  #temperature {
      color: #${base09};
  }

  #window {
      font-size: 12px;
  }

  #network,
  #bluetooth,
  #pulseaudio.out,
  #pulseaudio.in,
  #wireplumber,
  #battery.ok:not(.charging) {
      color: #${base0D};
  }

  #network.disconnected,
  #bluetooth.off,
  #pulseaudio.out.muted,
  #pulseaudio.in.source-muted,
  #wireplumber.muted,
  #temperature.critical {
      color: #${base08};
  }

  #battery.warning:not(.charging) {
      color: #${base0A};
  }

  @keyframes blink { 
      to {
          color: #${base05};
          background-color: rgba(100, 100, 115, 0.5);
      }
  }

  #battery.critical:not(.charging) {
      color: #${base08};
      animation-name: blink;
      animation-duration: 2s;
      animation-timing-function: steps(12);
      animation-iteration-count: infinite;
      animation-direction: alternate;
  }

  #battery.ok.charging,
  #battery.warning.charging,
  #battery.critical.charging {
      color: #${base0C};
  }

  #clock,
  #window,
  #workspaces {
      color: #${base05};
  }
  '';
  };
}