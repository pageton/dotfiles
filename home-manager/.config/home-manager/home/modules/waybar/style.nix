{ config, ... }:

let
  theme = config.theme.catppuccin.colors;
  font = config.theme.catppuccin.font;
in
{
  programs.waybar.style = ''
    * {
      border: none;
      border-radius: 0px;
      font-family: ${font};
      font-weight: bold;
      font-size: 10px;
      min-height: 10px;
    }

    window#waybar {
      background: ${theme.transparent.rgb};
    }

    tooltip {
      background: #${theme.crust.alpha};
      color: #${theme.text.alpha};
      border-radius: 7px;
      border-width: 0px;
    }

    #workspaces button {
      box-shadow: none;
      text-shadow: none;
      padding: 0px;
      border-radius: 8px;
      margin-top: 2px;
      margin-bottom: 2px;
      margin-left: 0px;
      padding-left: 2px;
      padding-right: 2px;
      margin-right: 0px;
      color: #${theme.text.alpha};
      animation: ws_normal 20s ease-in-out 1;
    }

    #workspaces button.active {
      background: #${theme.subtext0.alpha};
      color: #${theme.surface0.alpha};
      margin-left: 2px;
      padding-left: 11px;
      padding-right: 11px;
      margin-right: 2px;
      animation: ws_active 20s ease-in-out 1;
      transition: all 0.4s cubic-bezier(.55, -0.68, .48, 1.682);
    }

    #workspaces button:hover {
      background: #${theme.pink.alpha};
      color: #${theme.surface0.alpha};
      animation: ws_hover 20s ease-in-out 1;
      transition: all 0.3s cubic-bezier(.55, -0.68, .48, 1.682);
    }

    #taskbar button {
      box-shadow: none;
      text-shadow: none;
      padding: 0px;
      border-radius: 8px;
      margin-top: 2px;
      margin-bottom: 2px;
      margin-left: 0px;
      padding-left: 2px;
      padding-right: 2px;
      margin-right: 0px;
      color: #${theme.text.alpha};
      animation: tb_normal 20s ease-in-out 1;
    }

    #taskbar button.active {
      background: #${theme.subtext0.alpha};
      color: #${theme.base.alpha};
      margin-left: 2px;
      padding-left: 11px;
      padding-right: 11px;
      margin-right: 2px;
      animation: tb_active 20s ease-in-out 1;
      transition: all 0.4s cubic-bezier(.55, -0.68, .48, 1.682);
    }

    #taskbar button:hover {
      background: #${theme.pink.alpha};
      color: #${theme.red.alpha};
      animation: tb_hover 20s ease-in-out 1;
      transition: all 0.3s cubic-bezier(.55, -0.68, .48, 1.682);
    }

    #tray menu * {
      min-height: 16px
    }

    #tray menu separator {
      min-height: 10px
    }

    #backlight,
    #battery,
    #bluetooth,
    #custom-cava,
    #custom-cliphist,
    #clock,
    #clock,
    #custom-cpuinfo,
    #cpu,
    #custom-display,
    #custom-github_hyde,
    #custom-gpuinfo,
    #custom-hyprsunset,
    #idle_inhibitor,
    #custom-keybindhint,
    #language,
    #memory,
    #mpris,
    #network,
    #custom-notifications,
    #custom-power,
    #privacy,
    #pulseaudio,
    #custom-sensorsinfo,
    #custom-spotify,
    #taskbar,
    #taskbar,
    #taskbar#windows,
    #custom-theme,
    #tray,
    #custom-updates,
    #custom-wallchange,
    #custom-wbar,
    #custom-weather,
    #window,
    #workspaces,
    #workspaces,
    #workspaces,
    #custom-l_end,
    #custom-r_end,
    #custom-sl_end,
    #custom-sr_end,
    #custom-rl_end,
    #custom-rr_end {
      color: #${theme.text.alpha};
      background: #${theme.crust.alpha};
      opacity: 1;
      margin: 3px 0px 3px 0px;
      padding-left: 4px;
      padding-right: 4px;
    }

    #workspaces,
    #taskbar {
      padding: 0px;
    }

    #custom-r_end {
      border-radius: 0px 19px 19px 0px;
      margin-right: 8px;
      padding-right: 0px;
    }

    #custom-l_end {
      border-radius: 19px 0px 0px 19px;
      margin-left: 8px;
      padding-left: 0px;
    }

    #custom-sr_end {
      border-radius: 0px;
      margin-right: 8px;
      padding-right: 0px;
    }

    #custom-sl_end {
      border-radius: 0px;
      margin-left: 8px;
      padding-left: 0px;
    }

    #custom-rr_end {
      border-radius: 0px 7px 7px 0px;
      margin-right: 8px;
      padding-right: 0px;
    }

    #custom-rl_end {
      border-radius: 7px 0px 0px 7px;
      margin-left: 8px;
      padding-left: 0px;
    }
  '';
}
