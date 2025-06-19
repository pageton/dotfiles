{ ... }:

{
  programs.kitty = {
    enable = true;
    enableGitIntegration = true;
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 13;
    };
    shellIntegration.enableZshIntegration = true;
    themeFile = "Catppuccin-Mocha";

    settings = {
      tab_bar_edge = "bottom";
      tab_bar_style = "powerline";
      tab_powerline_style = "slanted";
      tab_title_template = "{title}{' :{}:'.format(num_windows) if num_windows > 1 else ''}";
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";
      enable_audio_bell = "no";
      window_padding_width = 25;
      cursor_trail = 1;
      background_opacity = 1;
    };

    extraConfig = ''
      map ctrl+shift+t new_tab_with_cwd
    '';
  };
}
