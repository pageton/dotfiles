{
  wayland.windowManager.hyprland.settings = {
    bind = [
      "$mod, T, exec, $terminal"
      "$mod, Q, killactive"
      "$mod, M, exec, exit"
      "$mod, E, exec, $fileManager"
      "$mod, B, exec, $browser"
      "$mod, W, togglefloating"
      "$mod, SPACE, exec, $menu"
      "$mod, I, togglesplit"
      "$mod, P, exec, hyprshot -m window"
      "$mod+CTRL, P, exec, hyprshot -m region"
      "CTRL+SHIFT, L, exec, hyprlock"
      "$mod, V, exec, cliphist list | wofi --dmenu | cliphist decode | wl-copy"
      "$mod, h, movefocus, l"
      "$mod, l, movefocus, r"
      "$mod, k, movefocus, u"
      "$mod, j, movefocus, d"
      "$mod ALT, RETURN, fullscreen"
      "$mod, 1, workspace, 1"
      "$mod, 2, workspace, 2"
      "$mod, 3, workspace, 3"
      "$mod, 4, workspace, 4"
      "$mod, 5, workspace, 5"
      "$mod, 6, workspace, 6"
      "$mod, 7, workspace, 7"
      "$mod, 8, workspace, 8"
      "$mod, 9, workspace, 9"
      "$mod, 0, workspace, 10"
      "$mod SHIFT, 1, movetoworkspace, 1"
      "$mod SHIFT, 2, movetoworkspace, 2"
      "$mod SHIFT, 3, movetoworkspace, 3"
      "$mod SHIFT, 4, movetoworkspace, 4"
      "$mod SHIFT, 5, movetoworkspace, 5"
      "$mod SHIFT, 6, movetoworkspace, 6"
      "$mod SHIFT, 7, movetoworkspace, 7"
      "$mod SHIFT, 8, movetoworkspace, 8"
      "$mod SHIFT, 9, movetoworkspace, 9"
      "$mod SHIFT, 0, movetoworkspace, 10"
      "$mod, S, togglespecialworkspace, magic"
      "$mod SHIFT, S, movetoworkspace, special:magic"
      "$mod, mouse_down, workspace, e+1"
      "$mod, mouse_up, workspace, e-1"
    ];

    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
      "$mod, Z, movewindow"
      "$mod, X, resizewindow"
    ];

    binde = [
      "$mod+SHIFT, l, resizeactive, 30 0"
      "$mod+SHIFT, h, resizeactive, -30 0"
      "$mod+SHIFT, k, resizeactive, 0 -30"
      "$mod+SHIFT, j, resizeactive, 0 30"
    ];

    bindl = [
      ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
      ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
    ];
  };
}
