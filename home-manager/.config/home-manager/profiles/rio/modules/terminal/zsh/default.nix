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
    history.size = 1000;
    history.append = true;

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
    };

    initContent = ''
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
      [[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
    '';
  };

}
