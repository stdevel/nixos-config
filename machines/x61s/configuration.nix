# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix

      ../../roles/all.nix
      ../../roles/desktop.nix

      ../../modules/grub_bios.nix

      ../../users/christian.nix
    ];

  networking.hostName = "st-x61s";
  networking.useDHCP = false;
  networking.networkmanager.enable = true;
  programs.nm-applet.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  # environment.systemPackages = with pkgs; [
  #   vim
  #   wget
  #   curl
  #   alacritty
  #   sway
  #   wayland
  #   xdg-utils
  #   glib
  #   dracula-theme
  #   gnome3.adwaita-icon-theme
  #   swaylock
  #   swayidle
  #   grim
  #   slurp
  #   wl-clipboard
  #   bemenu
  #   mako
  #   wdisplays
  #   firefox
  #   neofetch
  #   dmenu
  #   dmenu-wayland
  # ];


  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
  # networking.firewall.enable = true;
  # networking.firewall.allowedTCPPorts = [ 22 ];

  system.stateVersion = "22.11";

  # Wayland and sway
  # programs.sway = {
  #   enable = true;
  #   wrapperFeatures.gtk = true;
  # };
  # xdg.portal = {
  #   enable = true;
  #   wlr.enable = true;
  #   extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  # };

}
