{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Communication
    discord
    vesktop

    # Development & Engineering
    android-studio
    arduino-ide
    (google-antigravity.override { browserPkg = chromium; })
    (google-antigravity-ide.override { browserPkg = chromium; })
    logisim-evolution

    # Creative & Media
    gimp
    krita
    mpv
    obs-studio
    swappy

    # Productivity & Notes
    libreoffice
    obsidian
    xournalpp

    # Desktop & Utilities
    nemo
    qbittorrent
    wofi
  ];
}
