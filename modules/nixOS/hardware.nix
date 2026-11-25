{ pkgs, ... }:
{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      intel-media-driver
      vpl-gpu-rt
    ];
  };

  environment.sessionVariables.LIBVA_DRIVER_NAME = "iHD";

  hardware.bluetooth.enable = true;

  # Drawing tablet & virtual input support
  hardware.uinput.enable = true;
  hardware.opentabletdriver.enable = true;
}
