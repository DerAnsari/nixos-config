{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    wofi
    fastfetch
    cliphist
    gh
    ripgrep
    pywalfox-native
    lazygit
    ani-cli
    grim
    slurp
    swappy
    gcc
    gdb
    clang-tools
    tree-sitter
    nodejs
    playerctl
    brightnessctl
    spotdl
    (python3.withPackages (
      ps: with ps; [
        pypresence
        # Add other python libraries here if needed
      ]
    ))
    go

    nil
    lua-language-server
    rust-analyzer
    rustfmt
    clang-tools
    gopls
    pyright
    bash-language-server
    yaml-language-server

    stylua
    black
    ruff
    shfmt
    shellcheck
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
