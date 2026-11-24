{
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    inputs.noctalia.nixosModules.default
  ];

  # Window Manager & Shell
  programs.hyprland.enable = true;
  programs.noctalia.enable = true;

  # Display Manager & Desktop Environment
  services.displayManager.ly.enable = true;
  services.desktopManager.gnome.enable = true;
  services.displayManager.gdm.enable = false;

  environment.gnome.excludePackages = with pkgs; [
    epiphany
    geary
    gnome-music
    gnome-tour
    totem
    yelp
  ];

  # Desktop Services (file manager mounting, thumbnails, settings)
  services.gvfs.enable = true;
  services.udisks2.enable = true;
  services.tumbler.enable = true;
  programs.xfconf.enable = true;

  # Fonts
  fonts = {
    packages = with pkgs; [
      nerd-fonts.iosevka
    ];
    fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = [ "Iosevka Nerd Font" ];
        sansSerif = [ "Iosevka Nerd Font" ];
        serif = [ "Iosevka Nerd Font" ];
      };
    };
  };
}
