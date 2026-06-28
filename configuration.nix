{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  nixpkgs.config.allowUnfree = true;

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "Thinkpadt480s"; # Define your hostname.

  networking.networkmanager.enable = true;

  time.timeZone = "America/Chicago";

  programs.hyprland = {
	enable = true;
	xwayland.enable = true;
  };

  services = {
    desktopManager.plasma6.enable = true;
  };

  environment.variables = {
    QT_AUTO_SCREEN_SCALE_FACTOR = "1.5";
    XCURSOR_SIZE = "24";
    NIXOS_OZONE_WL = "1";
  };
   
  services.displayManager.ly.enable = true;

  # Enable CUPS to print documents.
   services.printing.enable = true;

  programs.fish.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.bella = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tree
    ];
    shell = pkgs.fish;
  };

  programs.firefox.enable = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
    extraPackages = with pkgs; [kdePackages.breeze adwaita];
  };


  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
   environment.systemPackages = with pkgs; [
     # needed for xwayland:
     xsettingsd

     vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
     wget
     btop
     kitty
     git
     fastfetch
     waybar
     hyprpaper 
     wofi
     brightnessctl
     swaynotificationcenter
     discord
 ];


  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    font-awesome
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"];

  system.stateVersion = "25.11"; 
}

