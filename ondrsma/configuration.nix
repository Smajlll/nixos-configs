{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  # things nobody cares about
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  networking.hostName = "ondra-lenovo";
  networking.networkmanager.enable = true;
  time.timeZone = "Europe/Prague";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "cs_CZ.UTF-8";
    LC_IDENTIFICATION = "cs_CZ.UTF-8";
    LC_MEASUREMENT = "cs_CZ.UTF-8";
    LC_MONETARY = "cs_CZ.UTF-8";
    LC_NAME = "cs_CZ.UTF-8";
    LC_NUMERIC = "cs_CZ.UTF-8";
    LC_PAPER = "cs_CZ.UTF-8";
    LC_TELEPHONE = "cs_CZ.UTF-8";
    LC_TIME = "cs_CZ.UTF-8";
  };
  services.xserver.enable = false;
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;
  services.xserver.xkb = {
    layout = "cz";
    variant = "";
  };
  console.keyMap = "cz-lat2";
  services.printing.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users.smoliko = {
    isNormalUser = true;
    description = "Ondřej Smolík";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
        libreoffice-qt6-fresh
        teams-for-linux
        discord
        fastfetch
        google-chrome
    ];
  };

  programs.firefox.enable = true;
  nixpkgs.config.allowUnfree = true;
  programs.steam.enable = true;

  # more things that i dont care about
  environment.systemPackages = with pkgs; [];
  system.stateVersion = "24.05"; # Did you read the comment?

}
