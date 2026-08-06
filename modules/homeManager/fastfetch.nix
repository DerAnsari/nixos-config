{ pkgs, ... }:

{
  programs.fastfetch = {
    enable = true;

    settings = {
      "$schema" = "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json";

      logo = {
        type = "file";
        source = "~/nixos-config/dotfiles/nixosLogo.txt"; 
        padding = {
          top = 1;
          left = 2;
          right = 2; # Kept tight so it hugs the logo properly
        };
      };

      display = {
        separator = " ";
      };

      modules = [
        "break"
        {
          type = "custom";
          format = "{#35}𝐒 𝐎 𝐏 𝐇 𝐎 𝐒";
        }
        {
          type = "os";
          key = " ";
          keyColor = "34";
        }
        {
          type = "kernel";
          key = " ";
          keyColor = "34";
        }
        {
          type = "packages";
          key = " ";
          keyColor = "34";
        }
        {
          type = "shell";
          key = " ";
          keyColor = "34";
        }
        {
          type = "wm";
          key = " ";
          keyColor = "34";
        }
        {
          type = "cursor";
          key = " ";
          keyColor = "34";
        }
        {
          type = "terminalfont";
          key = " ";
          keyColor = "34";
        }
        {
          type = "uptime";
          key = " ";
          keyColor = "34";
        }
        {
          type = "media";
          key = "󰝚 ";
          keyColor = "34";
        }
        "break"
        {
          type = "custom";
          format = "{#90}▃▃▃  {#31}▃▃▃  {#32}▃▃▃  {#33}▃▃▃  {#34}▃▃▃  {#35}▃▃▃  {#36}▃▃▃  {#37}▃▃▃";
        }
        "break"
      ];
    };
  };
}
