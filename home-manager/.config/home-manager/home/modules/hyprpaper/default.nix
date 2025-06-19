{ ... }:

{
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ "~/.config/backgrounds/forest_dark_winter.jpg" ];
      wallpaper = [ ",~/.config/backgrounds/forest_dark_winter.jpg" ];
    };
  };
}
