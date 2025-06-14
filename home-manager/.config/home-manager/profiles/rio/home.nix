{ pkgs, pkgs-unstable, ... }:

{
  imports = [
    ./modules/terminal/zsh
    ./modules/terminal/kitty
    ./modules/hypr/hyprland
    ./modules/hypr/hyprlock
    ./modules/hypr/hypridle
    ./modules/hypr/hyprpaper
    ./modules/waybar
    ./modules/wlogout
    ./modules/dunst
    ./modules/gtk
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
      zsh-powerlevel10k
      bibata-cursors
    ])
    ++ (with pkgs; [
      cargo
      gcc
      go
      nodejs
      python311
      python311Packages.pip
      rustc
    ]);

  fonts.fontconfig.enable = true;
  home.username = "rio";
  home.homeDirectory = "/home/rio";
  home.enableNixpkgsReleaseCheck = false;
  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}
