{ config, pkgs, inputs, ... }:
{
  imports =
    [ 
      ./hardware-configuration.nix
      ../../modules/nixOS/main-user.nix
      ../../modules/nixOS/audio.nix
      ../../modules/nixOS/desktop.nix
      ../../modules/nixOS/locale.nix
      ../../modules/nixOS/shell.nix
      inputs.home-manager.nixosModules.default
      inputs.noctalia.nixosModules.default
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  networking.hostName = "sophos"; 
  
  # networking.wireless.enable = true;  

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.networkmanager.enable = true;
  hardware.bluetooth.enable = true;

  programs.nix-ld.enable = true;

  main-user.enable = true;
  main-user.userName = "plagus";

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
     wl-clipboard
     bat
     wget
     curl
     git
     man
     unzip
     ffmpeg
     fzf
     zsh-powerlevel10k
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
    users = {
      "plagus" = import ./home.nix;
    };
  };

  system.stateVersion = "26.05"; 
}
