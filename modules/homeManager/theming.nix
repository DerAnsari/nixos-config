{ pkgs, lib, ... }:
{
  # Icon & Qt theming packages
  home.packages = with pkgs; [
    papirus-icon-theme
    papirus-folders
    libsForQt5.qtstyleplugin-kvantum
    qt6Packages.qtstyleplugin-kvantum
  ];

  # GTK Theme & Icons
  gtk = {
    enable = true;
    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
  };

  # Qt Theme
  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style.name = "kvantum";
  };

  # Declaratively seed writable Papirus icon directories on home-manager switch
  home.activation.setupPapirusIcons = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    ICON_DIR="$HOME/.local/share/icons"
    mkdir -p "$ICON_DIR"

    # Copy system Papirus to local directory if not already mutable
    if [ ! -d "$ICON_DIR/Papirus-Dark" ] || [ -L "$ICON_DIR/Papirus-Dark" ]; then
      rm -rf "$ICON_DIR"/Papirus*
      cp -r --no-preserve=mode ${pkgs.papirus-icon-theme}/share/icons/Papirus* "$ICON_DIR/"
      chmod -R +w "$ICON_DIR"/Papirus*
    fi
  '';
}
