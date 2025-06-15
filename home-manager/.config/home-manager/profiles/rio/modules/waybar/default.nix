{ ... }:

let
  waybarStyle = import ./style.nix;
in
{
  programs.waybar = {
    enable = true;

    style = waybarStyle.style;

    settings = [
      (import ./config.nix)
    ];
  };
}
