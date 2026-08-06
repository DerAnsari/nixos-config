{ pkgs, ... }:

{
  programs.firefox = {
    enable = true;

    nativeMessagingHosts = [
      pkgs.pywalfox-native
    ];

    profiles.default = {
      id = 0;
      isDefault = true;
      path = "wigait5e.default";

      settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      };
    };
  };
}
