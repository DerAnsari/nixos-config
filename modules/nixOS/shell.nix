{ config, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
  };

  users.users."plagus".shell = pkgs.zsh;
}
