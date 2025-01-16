# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./modules/hyprland.nix
      ./modules/flatpak.nix
      ./modules/coding.nix
      ./modules/fonts.nix
      ./modules/bluetooth.nix
      ./modules/sound.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Kyiv";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "uk_UA.UTF-8";
    LC_IDENTIFICATION = "uk_UA.UTF-8";
    LC_MEASUREMENT = "uk_UA.UTF-8";
    LC_MONETARY = "uk_UA.UTF-8";
    LC_NAME = "uk_UA.UTF-8";
    LC_NUMERIC = "uk_UA.UTF-8";
    LC_PAPER = "uk_UA.UTF-8";
    LC_TELEPHONE = "uk_UA.UTF-8";
    LC_TIME = "uk_UA.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;

    # Enable the GNOME Desktop Environment.
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.mechanosec = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "Mechanosec";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    packages = with pkgs; [];
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    home-manager

    openssl
    blueman
    pavucontrol
    unzip
    brightnessctl
    btop
    libnotify
    swappy
    grim
    slurp
    unzip

    obs-studio
    nemo
    #flameshot
    google-chrome
    firefox
    neovim
    kitty
  ];

  programs.zsh = {
    enable = true;
    ohMyZsh = {
      enable = true;
      theme = "amuse";
      plugins = [
        "git"
        "kubectl"
        "helm"
        "docker"
      ];
    };
    shellAliases = {
      yy = "yazi";
      vi = "nvim";
      pc-wifi = "node ~/utils/commands/wifi-cli/dist/app.js";
      pc-temp = "tlp-stat -t";
      pc-power = "upower -i /org/freedesktop/UPower/devices/battery_BAT0";
    };
    autosuggestions.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
  };

  programs.nix-ld.enable = true;

  system.stateVersion = "24.11"; # Did you read the comment?

}
