{ config, pkgs, ... }:
{
  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        normal.family = "Iosevka Nerd Font";
        size = 12.0;
      };
      window = {
        padding = { x = 8; y = 8; };
      };
      
      general.import = [
        "~/.config/alacritty/themes/noctalia.toml" 
      ];
    };
  };
}
