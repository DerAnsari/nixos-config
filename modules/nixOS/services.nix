{ config, ... }:
let
  user = config.main-user.userName;
  homeDir = "/home/${user}";
in
{
  services.flatpak.enable = true;
  services.tailscale.enable = true;
  # Recommended by NixOS/Tailscale to prevent strict rpfilter from dropping UDP packets
  networking.firewall.checkReversePath = "loose";

  services.syncthing = {
    enable = true;
    inherit user;
    dataDir = "${homeDir}/.local/share/syncthing";
    configDir = "${homeDir}/.config/syncthing";
    openDefaultPorts = true;

    settings = {
      devices = {
        "hermes" = {
          id = "LXUCK50-KEZYTS7-HCRGNJB-DQ72AFE-FNZNDEL-SLJWQE3-B2DVXC4-DMKLZQR";
          autoAcceptFolders = true; # Automatically accepts folders sent from Debian if needed
        };
      };
      folders = {
        "sophos" = {
          id = "sophos";
          path = "${homeDir}/Documents/Sophos";
          devices = [ "hermes" ];
        };
        "music" = {
          id = "music";
          path = "${homeDir}/music";
          devices = [ "hermes" ];
        };
        "university-material" = {
          id = "university-material";
          path = "${homeDir}/Documents/University-material";
          devices = [ "hermes" ];
        };
      };
    };
  };
}
