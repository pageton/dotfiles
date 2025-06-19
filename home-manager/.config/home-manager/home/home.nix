{ pkgs, pkgs-unstable, ... }:

{
  imports = [
    ./modules/zsh
    ./modules/kitty
    ./modules/hyprland
    ./modules/hyprlock
    ./modules/hypridle
    ./modules/hyprpaper
    ./modules/waybar
    ./modules/wlogout
    ./modules/dunst
    ./modules/gtk
    ./modules/themes
    ./modules/git
  ];

  home.packages =
    (with pkgs; [
      blueman
      cliphist
      cmake
      curl
      fastfetch
      git
      jq
      kitty
      lm_sensors
      networkmanagerapplet
      openssl
      parallel
      pciutils
      pavucontrol
      unzip
      wl-clipboard
      nautilus
      stow
      bat
      luajit
      gh
      pinentry
      gnupg
      zigpkgs."master"
    ])
    ++ (with pkgs; [
      dunst
      libdrm
      libnotify
      wofi
    ])
    ++ (with pkgs; [
      typstPackages.fontawesome_0_4_0
      noto-fonts
      fira-code
      nerd-fonts.jetbrains-mono
      meslo-lgs-nf
      noto-fonts-emoji
      gruvbox-plus-icons
      nordzy-icon-theme
      tela-circle-icon-theme
      tela-icon-theme
    ])
    ++ (with pkgs-unstable; [
      hyprshot
      neovim
      telegram-desktop
      brave
      bun
      lua-language-server
      gopls
      golines
      goimports-reviser
      gofumpt
      zsh-powerlevel10k
      bibata-cursors
    ])
    ++ (with pkgs; [
      gcc
      go
      nodejs
      python311
      python311Packages.pip
      rustup
    ]);

  fonts.fontconfig.enable = true;
  home.username = "rio";
  home.homeDirectory = "/home/rio";
  home.enableNixpkgsReleaseCheck = false;
  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}
