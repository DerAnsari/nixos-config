{ config, pkgs, ... }:
let
  dotfiles = "${config.home.homeDirectory}/nixos-config/dotfiles/hypr";
in
{
  # Symlink directly to your live home repository directory!
  xdg.configFile."hypr/hyprland.lua".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/hyprland.lua";
  xdg.configFile."hypr/conf".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/conf";

  # Force SHM in xdg-desktop-portal-hyprland to avoid PipeWire DMA-BUF screencopy crashes
  xdg.configFile."hypr/xdph.conf".text = ''
    screencopy {
        force_shm = true
    }
  '';
}
