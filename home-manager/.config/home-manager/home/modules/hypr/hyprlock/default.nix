{ config, ... }:

let
  theme = config.theme.catppuccin.colors;
  font = config.theme.catppuccin.font;
in
{
  programs.hyprlock = {
    enable = true;

    settings = {
      general = {
        disable_loading_bar = true;
        hide_cursor = true;
        no_fade_in = false;
      };

      background = [
        {
          monitor = "";
          path = "~/.config/backgrounds/aesthetic_deer.png";
          blur_passes = 2;
          blur_size = 6;
          color = theme.base.rgb;
        }
      ];

      label = [
        {
          monitor = "";
          text = "cmd[update:30000] echo \"$(date +'%R')\"";
          color = theme.text.rgb;
          font_size = 96;
          font_family = font;
          position = "-40, 0";
          halign = "right";
          valign = "top";
          shadow_passes = 2;
        }
        {
          monitor = "";
          text = "cmd[update:43200000] echo \"$(date +'%A, %d %B %Y')\"";
          color = theme.subtext1.rgb;
          font_size = 28;
          font_family = font;
          position = "-40, -160";
          halign = "right";
          valign = "top";
          shadow_passes = 1;
        }
      ];

      image = [
        {
          monitor = "";
          path = "~/.face";
          size = 110;
          border_color = theme.mauve.rgb;
          position = "0, 60";
          halign = "center";
          valign = "center";
        }
      ];

      input-field = [
        {
          monitor = "";
          size = "320, 65";
          outline_thickness = 4;
          dots_size = 0.22;
          dots_spacing = 0.23;
          dots_center = true;
          outer_color = theme.mauve.rgb;
          inner_color = theme.surface0.rgb;
          font_color = theme.text.rgb;
          fade_on_empty = false;
          placeholder_text = "<span foreground=\"##${theme.subtext1.alpha}\"><i>󰌾 Logged in as </i><span foreground=\"##${theme.mauve.alpha}\">$USER</span></span>";
          hide_input = false;
          check_color = theme.green.rgb;
          fail_color = theme.red.rgb;
          fail_text = "<i>Authentication Failed <b>($ATTEMPTS)</b></i>";
          capslock_color = theme.yellow.rgb;
          shadow_passes = 2;
          position = "0, -35";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
