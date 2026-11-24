{ ... }:
{
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;

  # ThinkPad battery charge thresholds (75% start, 80% stop)
  powerManagement.resumeCommands = ''
    if [ -f /sys/class/power_supply/BAT0/charge_control_end_threshold ]; then
      echo 75 > /sys/class/power_supply/BAT0/charge_control_start_threshold
      echo 80 > /sys/class/power_supply/BAT0/charge_control_end_threshold
    fi
  '';

  systemd.services.set-battery-threshold = {
    description = "Set ThinkPad battery charge limit to 80%";
    wantedBy = [ "multi-user.target" ];
    script = ''
      if [ -f /sys/class/power_supply/BAT0/charge_control_end_threshold ]; then
        echo 75 > /sys/class/power_supply/BAT0/charge_control_start_threshold
        echo 80 > /sys/class/power_supply/BAT0/charge_control_end_threshold
      fi
    '';
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };
  };
}
