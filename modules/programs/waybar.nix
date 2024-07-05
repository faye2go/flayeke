{
  pkgs,
  config,
  ...
}: let 
scheme = config.colorScheme.palette;
in {
    programs.waybar = {
        enable = true;

        # config

        settings = [{
            "layer" = "top";
            "position" = "top";
            "height" = 40;

            # layout

            "modules-left" = [
                "custom/wofi"
                "hyprland/workspaces"
                "group/system"
                "mpris"
                "cava"
            ];
            "modules-center" = [
                "hyprland/window"
            ];
            "modules-right" = [
                "tray"
                "group/device"
                "clock"
                "custom/swaync"
                "custom/logout"
            ];

            # modules-left

            "custom/wofi" = {
                "format" = "";
                "on-click" = "wofi --show drun";
                "tooltip" = false;
            };
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
                "format" = " {usage}%";
                "tooltip" = false;
            };
            "memory" = {
                "format" = " {}%";
            };
            "temperature" = {
                "critical-threshold" = 80;
                "format-critical" = "{icon} {temperatureC}°C";
                "format" = "{icon} {temperatureC}°C";
                "format-icons" = ["" "" "" "" ""];
                "tooltip" = false;
            };
            "group/player" = {
                "orientation" = "inherit";
                "modules" = [
                    "mpris"
                ];
            };
            "mpris" = {
                "format" = "{player_icon} <i>{title}</i>";
                "format-paused" = "{status_icon} <i>paused</i>";
                "tooltip-format" = "{artist} / {album} ({player})";
                "tooltip-format-status" = "{title} - {artist} / {album}. ({player})";
                "player-icons" = {
                    "default" = "";
                };
                "status-icons" = {
                    "paused" = "";
                };
            };
            "cava" = {
                "bars" = 14;
                "bar_delimiter" = 0;
                "autosens" = 0;
                "sensitivity" = 5;
                "sleep-timer" = 3;
                "hide_on_silence" = true;
                "input_delay" = 2;
                "format-icons" = ["▁" "▂" "▃" "▄" "▅" "▆" "▇" "█" ];
            };

            # modules-center

            "hyprland/window" = {
                "format" = "{title}";
            };

            # modules-right

            "tray" = {
                "spacing" = 10;
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
                "format-muted" = "󰖁";
                "format-icons" = {
                    "headphone" = "󰋋";
                    "hands-free" = "";
                    "headset" = "";
                    "phone" = "";
                    "portable" = "";
                    "car"= "";
                    "default"= ["󰝟" "󰕿" "󰖀" "󰕾"];
                };
            };
            "pulseaudio#in" = {
                "format" = "{format_source}";
                "format-source" = "󰍬";
                "format-source-muted" = "󰍭";
            };
            "bluetooth" = {
                "format" = "󰂯";
                "format-connected" = "{num_connections} 󰂯";
                "tooltip-format" = "no connection";
                "tooltip-format-connected" = "\n\n{device_enumerate}";
                "tooltip-format-enumerate-connected" = "{device_alias}";
            };
            "network" = {
                "format-wifi" = "󰤨";
                "format-ethernet" = "";
                "tooltip-format-wifi" = "{essid} ({signalStrength}%) {ifname} via {gwaddr}";
                "tooltip-format-ethernet" = "{ipaddr}/{cidr} {ifname} via {gwaddr}";
                "format-linked" = "󰌷";
                "tooltip-format-linked" = "{ifname} (No IP) {ifname} via {gwaddr";
                "format-disconnected"= "󰤭";
            };
            "battery" = {
                "states" = {
                    "ok" = 79;
                    "warning" = 30;
                    "critical" = 15;
                };
                "format" = "{capacity}% {icon}";
                "format-full" = "{capacity}% {icon}";
                "format-charging" = "{capacity}% 󰂄";
                "format-plugged" = "{capacity}% {icon}";
                "format-icons" = ["󰂃" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
            };
            "clock" = {
                "format" = "{:%a %Y-%m-%d, %H:%M}";
                "tooltip-format" = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
                "format-alt" = "{:%H:%M}";
            };
            "custom/swaync" = {
                "format" = "{}󰂚";
                "on-click" = "swaync-client -t";
                "tooltip" = false;
            };
            "custom/logout" = {
                "format" = "󰐥";
                "on-click" = "wlogout";
                "tooltip" = false;
            };
        }];

        # style.css

        # TODO: hex to rgb converter for nix colors theme variables because of css rgba

        style = with scheme; ''
        * {
            font-family: JetBrainsMono Nerd Font;
            font-weight: 300;
            font-stretch: condensed;
        }

        window#waybar {
            background-color: rgba(73,77,100,0.3);
            color: #${base05};
            border-radius: 0px;
            }

        #custom-wofi,
        #system,
        #tray,
        #device,
        #clock,
        #custom-swaync,
        #custom-logout {
            font-size: 16px;
            border-radius: 7px;
            background-color: rgba(73,77,100,0.5);
            margin: 7px;
            padding: 2px 6px;
        }

        #custom-wofi,
        #custom-swaync,
        #custom-logout {
            background-color: rgba(36,39,58,0.5);
        }


        #memory,
        #temperature,
        #mpris,
        #cava,
        #window,
        #pulseaudio.in,
        #bluetooth,
        #network,
        #battery {
            margin-left: 5px;
            }

        #cpu,
        #memory,
        #mpris,
        #cava,
        #window,
        #pulseaudio,
        #bluetooth,
        #network {
            margin-right: 5px;
            }

        #custom-wofi {
            padding-right: 12px;
        }

        #network {
            padding-left: 5px;
            padding-right: 8px;
        }

        #workspaces {
            font-size: 12px;
            border-radius: 7px;
            margin: 7px;
            background-color: rgba(36,39,58,0.5);
        }

        #workspaces button {
            border-radius: 7px;
            box-shadow: none;
            margin: 0;
            padding: 0 4px;
            background-color: transparent;
            transition-duration: 0.5s;
        }

        #workspaces button.active {
            background-color: #${base0D};
            color: #${base01};
            box-shadow: none;
        }

        #workspaces button:hover {
            color: #${base01};
            background: #${base05};
            box-shadow: none;
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

        #mpris {
            font-size: 14px;
            font-stretch: ultra-condensed;
        }

        #mpris.paused {
            color: #${base01};
        }

        #window {
            font-size: 12px;
        }

        #custom-swaync {
            padding-left: 8px;
            padding-right: 10px;
        }

        #custom-logout {
            padding-left: 9px;
            padding-right: 9px;
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
        #temperature.critical,
        #custom-logout {
            color: #${base08};
        }

        #custom-swaync,
        #battery.warning:not(.charging) {
            color: #${base0A};
        }

        @keyframes blink { 
            to {
                color: #${base05};
                background-color: rgba(100,100,115,0.5);
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
        #workspaces button {
            color: #${base05};
        }
        '';
    };
}