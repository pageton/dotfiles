{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./hardware.nix
    ./boot.nix
    ./network.nix
    ./services.nix
    ./rio.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nixpkgs.config.allowUnfree = true;

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  time.timeZone = "Asia/Baghdad";
  i18n.defaultLocale = "en_US.UTF-8";

  system.stateVersion = "25.05";
}
