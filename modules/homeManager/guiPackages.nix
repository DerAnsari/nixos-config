{ config, pkgs, lib, ...}:
{
  home.packages = with pkgs; [
    firefox
    papirus-icon-theme
    papirus-folders
    libsForQt5.qtstyleplugin-kvantum
    qt6Packages.qtstyleplugin-kvantum
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
