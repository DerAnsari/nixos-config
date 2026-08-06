{ pkgs, ...}:
{
  gtk = {
    enable = true;
    theme = {
      name = "adw-gtk3-dark"; # or "Adwaita-dark"
      package = pkgs.adw-gtk3;
    };
  };
  qt = {
    enable = true;
    platformTheme.name = "qtct"; # or "kvantum"
    style.name = "kvantum";
  };
}
