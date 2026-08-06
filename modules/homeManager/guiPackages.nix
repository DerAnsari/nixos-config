{ config, pkgs, ...}:
{
  home.packages = with pkgs; [
    firefox
    gimp
    krita
    libreoffice
    mpv
    osu-lazer-bin
    obs-studio
    obsidian
    qbittorrent
    tauon
    thunar
    thunar-archive-plugin
    thunar-volman
    vesktop
    zathura
  ];
}
