{ ... }:

{
  services = {
    displayManager = {
      sddm.enable = true;
      defaultSession = "hyprland";
    };
    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
    };

    redis.servers."default" = {
      enable = true;
      port = 6379;
      bind = "127.0.0.1";
    };
  };
}
