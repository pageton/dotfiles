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
  };
}
