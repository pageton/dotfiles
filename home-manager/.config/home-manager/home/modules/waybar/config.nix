{ ... }:

{
  programs.waybar.settings = [
    {
      layer = "top";
      output = [ "*" ];
      position = "top";
      mod = "dock";
      height = 30;
      exclusive = true;
      passthrough = false;
      gtk-layer-shell = true;
      reload_style_on_change = true;
      modules-left = [
        "custom/padd"
        "custom/l_end"
        "cpu"
        "memory"
        "custom/cpuinfo"
        "custom/gpuinfo"
        "custom/r_end"
        "custom/l_end"
        "idle_inhibitor"
        "clock"
        "custom/r_end"
        "custom/padd"
      ];
      modules-center = [
        "custom/padd"
        "custom/l_end"
        "hyprland/workspaces"
        "hyprland/window"
        "custom/r_end"
        "custom/padd"
      ];
      modules-right = [
        "custom/padd"
        "custom/l_end"
        "network"
        "pulseaudio"
        "pulseaudio#microphone"
        "custom/r_end"
        "custom/l_end"
        "privacy"
        "tray"
        "custom/r_end"
        "custom/l_end"
        "custom/wallchange"
        "custom/theme"
        "custom/wbar"
        "custom/power"
        "custom/r_end"
        "custom/padd"
      ];
      cpu = {
        interval = 10;
        format = "󰍛 {usage}%";
        rotate = 0;
        format-alt = "{icon0}{icon1}{icon2}{icon3}";
        format-icons = [
          "▁"
          "▂"
          "▃"
          "▄"
          "▅"
          "▆"
          "▇"
          "█"
        ];
      };
      memory = {
        states = {
          c = 90;
          h = 60;
          m = 30;
        };
        interval = 30;
        format = "󰾆 {used}GB";
        rotate = 0;
        format-m = "󰾅 {used}GB";
        format-h = "󰓅 {used}GB";
        format-c = " {used}GB";
        format-alt = "󰾆 {percentage}%";
        max-length = 10;
        tooltip = true;
        tooltip-format = "󰾆 {percentage}%\n {used:0.1f}GB/{total:0.1f}GB";
      };
      "custom/cpuinfo" = {
        exec = "~/.config/waybar/scripts/cpuinfo.sh";
        return-type = "json";
        format = "{}";
        rotate = 0;
        interval = 5;
        tooltip = true;
        max-length = 1000;
      };
      "custom/gpuinfo" = {
        exec = "~/.config/waybar/scripts/gpuinfo.sh";
        return-type = "json";
        format = "{}";
        rotate = 0;
        interval = 5;
        tooltip = true;
        max-length = 1000;
        on-click = "gpuinfo.sh --toggle";
      };
      "custom/gpuinfo#nvidia" = {
        exec = "gpuinfo.sh --use nvidia ";
        return-type = "json";
        format = "{}";
        rotate = 0;
        interval = 5;
        tooltip = true;
        max-length = 1000;
      };
      idle_inhibitor = {
        format = "{icon}";
        rotate = 0;
        format-icons = {
          activated = "󰅶 ";
          deactivated = "󰛊 ";
        };
        tooltip-format-activated = "Caffeine Mode Active";
        tooltip-format-deactivated = "Caffeine Mode Inactive";
      };
      "hyprland/workspaces" = {
        disable-scroll = false;
        rotate = 0;
        all-outputs = true;
        active-only = false;
        on-click = "activate";
        on-scroll-up = "hyprctl dispatch workspace -1";
        on-scroll-down = "hyprctl dispatch workspace +1";
        persistent-workspaces = { };
      };
      "hyprland/window" = {
        format = "  {}";
        rotate = 0;
        separate-outputs = true;
        rewrite = {
          "rio@nixos:(.*)" = "$1 ";
          "(.*) — Brave" = "$1  ";
          "(.*) — Dolphin" = "$1 󰉋";
          "(.*)Spotify" = "Spotify 󰓇";
          "(.*) - Discord" = "$1  ";
          "(.*) — Github" = "$1  ";
          "(.*)Github" = "Github ";
          "(.*)Spotify Free" = "Spotify 󰓇";
          "(.*)Spotify Premiun" = "Spotify 󰓇";
        };
        max-length = 50;
      };
      clock = {
        format = "{:%I:%M %p}";
        rotate = 0;
        format-alt = "{:%R 󰃭 %d·%m·%y}";
        tooltip-format = "<span>{calendar}</span>";
        calendar = {
          mode = "month";
          mode-mon-col = 3;
          on-scroll = 1;
          on-click-right = "mode";
          format = {
            months = "<span color='#ffead3'><b>{}</b></span>";
            weekdays = "<span color='#ffcc66'><b>{}</b></span>";
            today = "<span color='#ff6699'><b>{}</b></span>";
          };
        };
        actions = {
          on-click-right = "mode";
          on-click-forward = "tz_up";
          on-click-backward = "tz_down";
          on-scroll-up = "shift_up";
          on-scroll-down = "shift_down";
        };
      };

      network = {
        tooltip = true;
        format-wifi = " ";
        rotate = 0;
        format-ethernet = "󰈀 ";
        tooltip-format = ''
          Network: <big><b>{essid}</b></big>
          Signal strength: <b>{signaldBm}dBm ({signalStrength}%)</b>
          Frequency: <b>{frequency}MHz</b>
          Interface: <b>{ifname}</b>
          IP: <b>{ipaddr}/{cidr}</b>
          Gateway: <b>{gwaddr}</b>
          Netmask: <b>{netmask}</b>
        '';
        format-linked = "󰈀 {ifname} (No IP)";
        format-disconnected = "󰖪 ";
        tooltip-format-disconnected = "Disconnected";
        format-alt = "<span foreground='#99ffdd'> {bandwidthDownBytes}</span> <span foreground='#ffcc66'> {bandwidthUpBytes}</span>";
        interval = 2;
      };

      pulseaudio = {
        format = "{icon} {volume}";
        rotate = 0;
        format-muted = "婢";
        on-click = "pavucontrol -t 3";
        tooltip-format = "{icon} {desc} // {volume}%";
        scroll-step = 5;
        format-icons = {
          headphone = "";
          hands-free = "";
          headset = "";
          phone = "";
          portable = "";
          car = "";
          default = [ "" "" "" ];
        };
      };

      "pulseaudio#microphone" = {
        format = "{format_source}";
        rotate = 0;
        format-source = "";
        format-source-muted = "";
        on-click = "pavucontrol -t 4";
        tooltip-format = "{format_source} {source_desc} // {source_volume}%";
        scroll-step = 5;
      };

      privacy = {
        icon-size = 12;
        icon-spacing = 5;
        transition-duration = 250;
        modules = [
          {
            type = "screenshare";
            tooltip = true;
            tooltip-icon-size = 24;
          }
          {
            type = "audio-in";
            tooltip = true;
            tooltip-icon-size = 24;
          }
        ];
      };

      tray = {
        "icon-size" = 16;
        rotate = 0;
        spacing = 5;
      };

      "custom/power" = {
        format = "{}";
        rotate = 0;
        exec = "echo ; echo  logout";
        on-click = "wlogout";
        interval = 86400;
        tooltip = true;
      };

      "custom/l_end" = {
        format = " ";
        interval = "once";
        tooltip = false;
      };
      "custom/r_end" = {
        format = " ";
        interval = "once";
        tooltip = false;
      };
      "custom/sl_end" = {
        format = " ";
        interval = "once";
        tooltip = false;
      };
      "custom/sr_end" = {
        format = " ";
        interval = "once";
        tooltip = false;
      };
      "custom/rl_end" = {
        format = " ";
        interval = "once";
        tooltip = false;
      };
      "custom/rr_end" = {
        format = " ";
        interval = "once";
        tooltip = false;
      };
      "custom/padd" = {
        format = "  ";
        interval = "once";
        tooltip = false;
      };
    }
  ];
}
