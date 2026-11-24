{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # General CLI Utilities
    ani-cli
    bat
    ffmpeg
    fzf
    google-antigravity-cli
    lazygit
    ripgrep

    # Wayland & System CLI Utilities
    brightnessctl
    cliphist
    grim
    playerctl
    slurp
    wl-clipboard
    wtype

    # Compilers, Runtimes & Toolchains
    android-tools
    arduino-cli
    cabal-install
    gcc
    gdb
    ghc
    go
    nodejs
    (python3.withPackages (
      ps: with ps; [
        jupyterlab
        matplotlib
        numpy
        pandas
        pypresence
        scipy
        sympy
      ]
    ))
    tree-sitter

    # Language Servers (LSP)
    bash-language-server
    clang-tools
    gopls
    haskell-language-server
    lua-language-server
    nil
    pyright
    rust-analyzer
    yaml-language-server

    # Formatters & Linters
    black
    haskellPackages.ormolu
    ruff
    rustfmt
    shellcheck
    shfmt
    stylua
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
}
