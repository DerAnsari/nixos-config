{ pkgs, ... }:

{
  programs.zathura = {
    enable = true;
    extraConfig = ''
      include noctaliarc
    '';
  };
}
