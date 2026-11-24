{
  config,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixOS/audio.nix
    ../../modules/nixOS/desktop.nix
    ../../modules/nixOS/gaming.nix
    ../../modules/nixOS/hardware.nix
    ../../modules/nixOS/locale.nix
    ../../modules/nixOS/main-user.nix
    ../../modules/nixOS/power.nix
    ../../modules/nixOS/services.nix
    ../../modules/nixOS/shell.nix
  ];

  # Bootloader & Kernel
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        device = "nodev"; # "nodev" = UEFI install, no MBR target
        efiSupport = true;
        useOSProber = true; # detects other OSes like Windows
        theme = "${inputs.lobo-grub-theme}/lobocorp";
        gfxmodeEfi = "1920x1080";
        configurationLimit = 2;
      };
    };
  };

  # Networking (host-specific)
  networking = {
    hostName = "sophos";
    networkmanager = {
      enable = true;
      # Share connection over Ethernet (PC as a router)
      ensureProfiles.profiles."Share-Ethernet" = {
        connection = {
          id = "Share-Ethernet";
          type = "ethernet";
          interface-name = "enp0s31f6";
        };
        ipv4.method = "shared";
        ipv6.method = "ignore";
      };
    };
  };

  # Nix & Nixpkgs
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nixpkgs = {
    config.allowUnfree = true;
    overlays = [
      inputs.antigravity-nix.overlays.default
    ];
  };

  # Main User
  main-user = {
    enable = true;
    userName = "plagus";
  };

  # Compatibility for unpatched dynamic binaries
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      icu
      openssl
      zlib
      stdenv.cc.cc.lib
    ];
  };

  # Core System Packages
  environment.systemPackages = with pkgs; [
    curl
    git
    man
    unzip
    wget
  ];

  # Home Manager
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
    users.${config.main-user.userName} = import ./home.nix;
  };

  system.stateVersion = "26.05";
}
