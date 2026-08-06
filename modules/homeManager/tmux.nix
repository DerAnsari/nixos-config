{ config, pkgs, ...}:
{
  programs.tmux = {
    enable = true;
    clock24 = true;
    keyMode = "vi";
    prefix = "C-s";
    baseIndex = 1;
    escapeTime = 0;
    historyLimit = 10000;
    plugins = with pkgs.tmuxPlugins; [
      sensible
      yank
      resurrect
      continuum
    ];
    extraConfig = ''
      set -g mouse on
      bind | split-window -h
      bind - split-window -v
      bind-key -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "wl-copy"
      set -ga update-environment "WAYLAND_DISPLAY"
    '';
  };
}
