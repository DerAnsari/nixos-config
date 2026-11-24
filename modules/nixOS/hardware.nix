{ ... }:
{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.bluetooth.enable = true;

  # Drawing tablet & virtual input support
  hardware.uinput.enable = true;
  hardware.opentabletdriver.enable = true;
}
