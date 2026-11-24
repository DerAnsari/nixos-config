{ ... }:
{
  imports = [
    # Packages
    ../../modules/homeManager/cliPackages.nix
    ../../modules/homeManager/guiPackages.nix

    # Desktop & Theming
    ../../modules/homeManager/hyprland-config.nix
    ../../modules/homeManager/noctalia.nix
    ../../modules/homeManager/theming.nix

    # Terminal & Shell
    ../../modules/homeManager/alacritty.nix
    ../../modules/homeManager/btop.nix
    ../../modules/homeManager/fastfetch.nix
    ../../modules/homeManager/neovim.nix
    ../../modules/homeManager/tmux.nix
    ../../modules/homeManager/zsh.nix

    # Applications
    ../../modules/homeManager/firefox.nix
    ../../modules/homeManager/zathura.nix
  ];

  home = {
    username = "plagus";
    homeDirectory = "/home/plagus";
    stateVersion = "26.05";
    sessionPath = [ "$HOME/.local/bin" ];
  };

  programs.home-manager.enable = true;
}
