{ pkgs, lib, ... }:
let
  mikuCursor = pkgs.stdenvNoCC.mkDerivation {
    pname = "miku-cursor-linux";
    version = "1.2.6";
    src = ../../dotfiles/cursors/miku-cursor-linux-1.2.6.tar.xz;

    dontConfigure = true;
    dontBuild = true;

    installPhase = ''
      runHook preInstall
      mkdir -p $out/share/icons/miku-cursor-linux
      cp -rP . $out/share/icons/miku-cursor-linux/
      runHook postInstall
    '';
  };
in
{
  # Icon & Qt theming packages
  home.packages = with pkgs; [
    papirus-icon-theme
    papirus-folders
    libsForQt5.qtstyleplugin-kvantum
    qt6Packages.qtstyleplugin-kvantum
  ];

  # Cursor Theme
  home.pointerCursor = {
    enable = true;
    package = mikuCursor;
    name = "miku-cursor-linux";
    size = 32;
    gtk.enable = true;
    x11.enable = true;
  };

  # Sync cursor settings for GTK4 / Wayland / Electron apps reading dconf
  dconf.settings."org/gnome/desktop/interface" = {
    cursor-theme = "miku-cursor-linux";
    cursor-size = 32;
  };

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

  # Remove any non-symlink manual cursor extraction before Home Manager links it
  home.activation.cleanupManualMikuCursor = lib.hm.dag.entryBefore [ "checkLinkTargets" ] ''
    if [ -d "$HOME/.local/share/icons/miku-cursor-linux" ] && [ ! -L "$HOME/.local/share/icons/miku-cursor-linux" ]; then
      rm -rf "$HOME/.local/share/icons/miku-cursor-linux"
    fi
  '';

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
