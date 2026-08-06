{ config, pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    initLua= ''
      vim.opt.clipboard = "unnamedplus"
    '';
  };
}
