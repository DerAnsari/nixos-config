{ config, pkgs, ... }:
{
  programs.btop = {
    enable = true;
    settings = {
      color_theme = "noctalia"; # Tells btop to load Noctalia's generated theme
      theme_background = true;
      truecolor = true;
      rounded_corners = true;
      graph_symbol = "braille";
      shown_boxes = "cpu mem net proc";
      update_ms = 2000;
      proc_sorting = "cpu lazy";
      proc_colors = true;
      proc_gradient = true;
      proc_cpu_graphs = true;
      show_uptime = true;
      check_temp = true;
      show_coretemp = true;
      temp_scale = "celsius";
      show_swap = true;
      show_disks = true;
      only_physical = true;
      show_battery = true;
      
      # VERY IMPORTANT for NixOS/Home Manager:
      # Prevents btop from overwriting this read-only config when you exit the app
      save_config_on_exit = false;
    };
  };
}
