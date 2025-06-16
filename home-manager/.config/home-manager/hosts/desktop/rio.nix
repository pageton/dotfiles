{ pkgs, ... }:

{
  users.users.rio = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "Rio";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = [ ];
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-hyprland
    ];
  };

  services.dbus.enable = true;

  programs = {
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
    zsh.enable = true;
  };
}
