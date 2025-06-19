{ ... }:

{
  imports = [
    ./animations.nix
    ./bindings.nix
    ./inputs.nix
    ./globals.nix
    ./appearance.nix
    ./layouts.nix
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    settings = {
      monitor = [ "DP-4,preferred,auto,auto" ];
      gestures = {
        workspace_swipe = false;
      };
      exec-once = [
        "hypridle &"
        "hyprpaper &"
        "waybar &"
        "nm-applet --indicator &"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
      ];
      windowrule = [
        "suppressevent maximize, class:.*"
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
      ];
    };
  };
}
