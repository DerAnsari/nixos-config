{ config, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    initContent = ''
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
    '';

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "history"
        "sudo"
        "fzf"
        "command-not-found"
        "extract"
        "colored-man-pages"
      ];
    };
  };

  home.file.".p10k.zsh".source = ../../dotfiles/p10k.zsh;
}
