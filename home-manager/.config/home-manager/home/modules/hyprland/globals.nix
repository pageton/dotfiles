{
  wayland.windowManager.hyprland.settings = {

    "$mod" = "SUPER";
    "$terminal" = "kitty";
    "$fileManager" = "nautilus";
    "$browser" = "brave";
    "$menu" = "wofi --show drun";

    env = [
      "XCURSOR_SIZE,24"
      "HYPRCURSOR_SIZE,24"
      "HYPRCURSOR_THEME,Bibata-Modern-Ice"
      "XCURSOR_THEME,Bibata-Modern-Ice"
      "LIBVA_DRIVER_NAME,nvidia"
      "__GLX_VENDOR_LIBRARY_NAME,nvidia"
      "GBM_BACKEND,nvidia-drm"
    ];
  };
}
