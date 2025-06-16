{ ... }:

{
  imports = [
    ./style.nix
    ./config.nix
  ];
  programs.waybar = {
    enable = true;
  };
}
