{ config, pkgs, ... }:
{
  programs.hyprland.enable = true;
  services.displayManager.ly.enable = true;
  programs.noctalia.enable = true;
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;
  services.tumbler.enable = true;
  programs.xfconf.enable = true;
  programs.zoxide.enable = true;

  fonts.packages = with pkgs; [
    nerd-fonts.iosevka
  ];

  users.users.plagus.extraGroups = [ "video" ];

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = [ "Iosevka Nerd Font" ];
      sansSerif = [ "Iosevka Nerd Font" ];
      serif = [ "Iosevka Nerd Font" ];
    };
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  hardware.opentabletdriver.enable = true;

  environment.systemPackages = with pkgs; [
    heroic
    opentabletdriver 
  ];
}
