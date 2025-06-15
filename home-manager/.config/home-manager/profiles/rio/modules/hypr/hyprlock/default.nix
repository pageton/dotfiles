{ ... }:

let
  theme = import ./mocha.nix;
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
          color = theme.colors.base.rgb;
        }
      ];

      label = [
        {
          monitor = "";
          text = "cmd[update:30000] echo \"$(date +'%R')\"";
          color = theme.colors.text.rgb;
          font_size = 96;
          font_family = theme.font;
          position = "-40, 0";
          halign = "right";
          valign = "top";
          shadow_passes = 2;
        }
        {
          monitor = "";
          text = "cmd[update:43200000] echo \"$(date +'%A, %d %B %Y')\"";
          color = theme.colors.subtext1.rgb;
          font_size = 28;
          font_family = theme.font;
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
          border_color = theme.colors.mauve.rgb;
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
          outer_color = theme.colors.mauve.rgb;
          inner_color = theme.colors.surface0.rgb;
          font_color = theme.colors.text.rgb;
          fade_on_empty = false;
          placeholder_text = "<span foreground=\"##${theme.colors.subtext1.alpha}\"><i>󰌾 Logged in as </i><span foreground=\"##${theme.colors.mauve.alpha}\">$USER</span></span>";
          hide_input = false;
          check_color = theme.colors.green.rgb;
          fail_color = theme.colors.red.rgb;
          fail_text = "<i>Authentication Failed <b>($ATTEMPTS)</b></i>";
          capslock_color = theme.colors.yellow.rgb;
          shadow_passes = 2;
          position = "0, -35";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
