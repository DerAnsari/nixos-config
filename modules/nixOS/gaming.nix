{
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    inputs.aagl.nixosModules.default
  ];

  nix.settings = inputs.aagl.nixConfig;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    extraCompatPackages = [ pkgs.proton-ge-bin ];
  };

  programs.honkers-railway-launcher.enable = true;

  environment.systemPackages = with pkgs; [
    heroic
  ];
}
