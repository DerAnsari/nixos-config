{ config, pkgs, ...}:
{
  home.packages = with pkgs; [
    wofi
    fastfetch
    cliphist
    gh
    pywalfox-native
    lazygit
    ani-cli
    grim
    slurp
    swappy
    playerctl
    brightnessctl
    spotdl
    (python3.withPackages (ps: with ps; [
      pypresence
      # Add other python libraries here if needed
    ]))
  ];

  programs.eza = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.gh = {
    enable = true;
    settings = {
      git_protocol = "ssh";
    };
  };

  programs.firefox = {
    enable = true;
    nativeMessagingHosts = [
      pkgs.pywalfox-native
    ];
  };
}
