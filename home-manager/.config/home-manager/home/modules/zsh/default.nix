{ pkgs, ... }:
{
  imports = [
    ./aliases.nix
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    history.size = 10000;
    history.save = 10000;

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "sudo" ];
      custom = builtins.toString ./custom_omz_dir;
      theme = "oxide";
    };

  };

}
