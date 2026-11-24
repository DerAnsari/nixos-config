{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.zsh.enable = true;
  programs.zoxide.enable = true;

  users.users = lib.mkIf config.main-user.enable {
    ${config.main-user.userName}.shell = pkgs.zsh;
  };
}
