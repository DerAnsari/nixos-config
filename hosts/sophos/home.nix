{ config, pkgs, inputs, ... }:
{
  imports = [
    ../../modules/homeManager/cliPackages.nix
    ../../modules/homeManager/guiPackages.nix
    ../../modules/homeManager/neovim.nix
    ../../modules/homeManager/noctalia.nix
    ../../modules/homeManager/tmux.nix
    ../../modules/homeManager/alacritty.nix
    ../../modules/homeManager/hyprland-config.nix
    ../../modules/homeManager/btop.nix
    ../../modules/homeManager/zsh.nix
    ../../modules/homeManager/zathura.nix
    ../../modules/homeManager/icons.nix
    ../../modules/homeManager/gtkNqt.nix
    ../../modules/homeManager/firefox.nix
    ../../modules/homeManager/fastfetch.nix
  ];
  home.username = "plagus";
  home.homeDirectory = "/home/plagus";
  home.stateVersion = "26.05"; 


  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };


  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/plagus/etc/profile.d/hm-session-vars.sh
  #
  # home.sessionVariables = {
  #   EDITOR = "neovim";
  # };

  programs.home-manager.enable = true;
}
