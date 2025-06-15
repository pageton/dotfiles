{ ... }:

{
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "hyprlock";
        unlock_cmd = "notify-send '🔓 Unlocked!'";
        # before_sleep_cmd = "hyprlock";
        after_sleep_cmd = "notify-send '🛌 Awake!'";
        ignore_dbus_inhibit = false;
        ignore_systemd_inhibit = false;
      };
      listener = [
        {
          timeout = 120;
          on-timeout = "hyprlock";
        }
        {
          timeout = 300;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
        {
          timeout = 500;
          on-timeout = "systemctl suspend";
        }
      ];
    };
  };
}
