{ config, pkgs, lib, ... }:

let
  home-manager = (import ../nix/sources.nix).home-manager;
  unstable = import <nixos-unstable> { };
  fontSize = hiDPI: if hiDPI then "FiraCode:size=14" else "FiraCode:size=8";
in
{
  imports = [
    "${home-manager}/nixos"
  ];


  home-manager.users.christian = { pkgs, ... }: {
    imports = [
      modules/sway.nix
      # modules/git.nix
      # modules/kanshi.nix

    home.stateVersion = "21.11";

    gtk = {
      enable = true;
      theme = {
        name = "Adwaita";
        package = pkgs.gnome3.adwaita-icon-theme;
      };
    };

    xdg = {
      enable = true;
    };

    services.gnome-keyring.enable = true;

    home.packages = with pkgs; [
      wdisplays
      firefox
      evince
      chromium
      gnupg
      gpicview
      hicolor-icon-theme
      signal-desktop
      nix-output-monitor

      dnsutils
      ncdu
      python3
      pavucontrol
      jq
      psmisc
      zip

      sway
      wayland
      swaylock
      swayidle
      dmenu
      dmenu-wayland
      bemenu
      mako
      grim
      slurp
      brightnessctl
      wl-clipboard
      foot
      wofi
      unzip
      whois
      acpi
      neofetch

      htop
      xdg-utils
      moreutils
    ]

    programs.git = {
      enable = true;
      userName = "Christian Stankowic";
      userEmail = "info@cstan.io";
    };

    programs.waybar = {
      enable = true;
      settings = [{
        layer = "top";
        position = "bottom";
        height = 28;
        modules-left = [
          "sway/workspaces"
          "sway/window"
        ];
        modules-center = [
        ];
        modules-right = [
          "sway/mode"
          "disk"
          "pulseaudio"
          "network"
          "memory"
          "cpu"
          "temperature"
          "battery"
          "tray"
          "clock"
        ];
        modules = {
          "battery" = {
            states = {
              warning = 20;
              critical = 10;
            };
            format = " {capacity}%";
            format-discharging = "{icon} {capacity}%";
            format-icons = [
              ""
              ""
              ""
              ""
              ""
              ""
              ""
              ""
              ""
              ""
            ];
          };
          "cpu" = {
            format = "  {}";
          };
          "clock" = {
            format = "{:%H:%M}";
            tooltip = false;
          };
          "memory" = {
            interval = 5;
            format = "  {}%";
            tooltip-format = "{used:0.1f}/{total:0.1f} GB";
            states = {
              warning = 80;
              critical = 90;
            };
          };
          "network" = {
            interface = "wl*";
            format-wifi = "  {essid}";
            format-icons = [
              ""
            ];
            tooltip-format-wifi = "{frequency} MHz, {signaldBm} dBm";
          };
          "pulseaudio" = {
            scroll-step = 1;
            format = "{icon}  {volume}%";
            format-bluetooth = "{icon} {volume}% ";
            format-muted = "";
            format-icons = {
              headphones = "";
              handsfree = "";
              headset = "";
              phone = "";
              portable = "";
              car = "";
              default = [ "" "" ];
            };
            on-click = "pavucontrol";
          };
          "sway/workspaces" = {
            all-outputs = false;
            disable-scroll = false;
            format = "{name}";
          };
          "temperature" = {
            format = " {temperatureC}°C";
            hwmon-path = "/sys/class/hwmon/hwmon3/temp1_input";
            critical-threshold = 75;
          };
          "disk" = {
            interval = 30;
            format = "{free} free";
            path = "/";
          };
        };
      }];
      style = builtins.readFile ./waybar.css;
    };

    services.kanshi = {
      enable = true;

    };

    services.gammastep = {
      enable = true;
      tray = true;
      latitude = "49.8";
      longitude = "8.6";
      temperature = {
        day = 5500;
        night = 3300;
      };

    };

    # Enable blueman-applet when the machine has bluetooth enabled
    services.blueman-applet.enable = config.hardware.bluetooth.enable == true;

    programs.foot = {
      enable = true;
      settings = {
        main = {
          term = "xterm-256color";
          font = fontSize config.my.highDPI;
        };
        scrollback = { lines = 100000; };
        colors = {
          alpha = "0.98";
          foreground = "B3B1AD";
          background = "0A0E14";
          regular0 = "01060E";
          regular1 = "EA6C73";
          regular2 = "91B362";
          regular3 = "F9AF4F";
          regular4 = "53BDFA";
          regular5 = "FAE994";
          regular6 = "90E1C6";
          regular7 = "C7C7C7";
          bright0 = "686868";
          bright1 = "F07178";
          bright2 = "C2D94C";
          bright3 = "FFB454";
          bright4 = "59C2FF";
          bright5 = "FFEE99";
          bright6 = "95E6CB";
          bright7 = "FFFFFF";
        };
      };
    };

  };
}
