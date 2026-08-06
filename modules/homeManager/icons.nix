{ pkgs, lib, ... }:

{
  # Install Papirus icons and the papirus-folders tool
  home.packages = with pkgs; [
    papirus-icon-theme
    papirus-folders
  ];

  # Set GTK icon theme declaratively
  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
  };

  # Declaratively seed writable Papirus icon directories on home-manager switch
  home.activation.setupPapirusIcons = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    ICON_DIR="$HOME/.local/share/icons"
    mkdir -p "$ICON_DIR"

    # Symlink/copy system Papirus to local directory if not already mutable
    if [ ! -d "$ICON_DIR/Papirus-Dark" ] || [ -L "$ICON_DIR/Papirus-Dark" ]; then
      rm -rf "$ICON_DIR/Papirus*"
      cp -r --no-preserve=mode ${pkgs.papirus-icon-theme}/share/icons/Papirus* "$ICON_DIR/"
      chmod -R +w "$ICON_DIR/Papirus*"
    fi
  '';
}
