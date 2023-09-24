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

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
  # networking.firewall.enable = true;
  # networking.firewall.allowedTCPPorts = [ 22 ];

  system.stateVersion = "22.11";
}
