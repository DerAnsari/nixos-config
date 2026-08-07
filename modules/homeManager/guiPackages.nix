{ config, pkgs, lib, ...}:
let
  pypresence-new = pkgs.python3Packages.pypresence.overridePythonAttrs (old: rec {
    version = "4.6.1";
    src = pkgs.fetchPypi {
      pname = "pypresence";
      inherit version;
      hash = "sha256-BRmVFqO04YK2N7PNVBWqt7pUJwdmT2NPNaciDE8QM08=";
    };
  });
in
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
    (symlinkJoin {
      name = "tauon-with-discord-rpc";
      paths = [ tauon ];
      buildInputs = [ makeWrapper ];
      postBuild = ''
        wrapProgram $out/bin/tauon \
          --prefix PYTHONPATH : "${pypresence-new}/lib/python3.13/site-packages"
      '';
    })
    thunar
    thunar-archive-plugin
    thunar-volman
    vesktop
    zathura
  ];
}
