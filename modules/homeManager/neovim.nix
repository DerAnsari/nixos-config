{ config, pkgs, lib, inputs, ... }:
let
  nvimSrc = inputs.nvim-config;
  excluded = [ "lua/matugen.lua" ];

  walk = dir: prefix:
    lib.concatMapAttrs (name: type:
      let
        relPath = "${prefix}${name}";
        fullPath = dir + "/${name}";
      in
      if type == "directory"
      then walk fullPath "${relPath}/"
      else if builtins.elem relPath excluded
      then { }
      else { ${relPath} = { source = fullPath; }; }
    ) (builtins.readDir dir);

  nvimFiles = walk nvimSrc "";
in
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  xdg.configFile = lib.mapAttrs'
    (name: value: lib.nameValuePair "nvim/${name}" value)
    nvimFiles;
}
