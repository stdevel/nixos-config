{ pkgs, nixosConfig, lib, ... }:
let
  lockCmd = "${pkgs.swaylock}/bin/swaylock -c 645394";
in
{
  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true;

    config = {
      focus.followMouse = false;

      input = {
        "type:keyboard" = { xkb_layout = "de"; };
        "type:mouse" = { pointer_accel = "-1"; };
      };

    #   gaps = { inner = 8; };
    #   window.border = 0;
    #   workspaceAutoBackAndForth = true;
      terminal = "foot";

      bars = [{ command = "${pkgs.waybar}/bin/waybar"; }];

    #   startup = [
    #     {
    #       command = ''${pkgs.swayidle}/bin/swayidle -w \
    #                        timeout 600 "${lockCmd}" \
    #                        timeout 900 "${pkgs.sway}/bin/swaymsg output * dpms off" \
    #                             resume "${pkgs.sway}/bin/swaymsg output * dpms on" \
    #                        before-sleep "${lockCmd}"'';
    #     }
    #   ];



    #   keybindings =
    #     let
    #       mod = "Mod4";
    #       pactl = "${pkgs.pulseaudio}/bin/pactl";
    #       playerctl = "${pkgs.playerctl}/bin/playerctl";
    #     in
    #     {
    #       "${mod}+Return" = "exec foot";
    #       "${mod}+p" = "exec ${pkgs.wofi}/bin/wofi --show drun";

    #       "${mod}+Shift+c" = "reload";
    #       "${mod}+Shift+q" = "kill";
    #       "${mod}+Shift+e" =
    #         "exec swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -b 'Yes, exit sway' 'swaymsg exit'";
    #       "${mod}+x" = "move workspace to output right";

    #       "${mod}+h" = "focus left";
    #       "${mod}+j" = "focus down";
    #       "${mod}+k" = "focus up";
    #       "${mod}+l" = "focus right";

    #       "${mod}+Shift+h" = "move left";
    #       "${mod}+Shift+j" = "move down";
    #       "${mod}+Shift+k" = "move up";
    #       "${mod}+Shift+l" = "move right";

    #       "${mod}+s" = "split v";
    #       "${mod}+w" = "split h";

    #       "${mod}+t" = "layout tabbed";
    #       "${mod}+r" = "mode resize";

    #       "${mod}+f" = "fullscreen toggle";
    #       "${mod}+Shift+space" = "floating toggle";

    #       "${mod}+1" = "workspace 1";
    #       "${mod}+2" = "workspace 2";
    #       "${mod}+3" = "workspace 3";
    #       "${mod}+4" = "workspace 4";
    #       "${mod}+5" = "workspace 5";
    #       "${mod}+6" = "workspace 6";
    #       "${mod}+7" = "workspace 7";
    #       "${mod}+8" = "workspace 8";
    #       "${mod}+9" = "workspace 9";
    #       "${mod}+0" = "workspace 10";

    #       "${mod}+Shift+1" = "move container to workspace 1";
    #       "${mod}+Shift+2" = "move container to workspace 2";
    #       "${mod}+Shift+3" = "move container to workspace 3";
    #       "${mod}+Shift+4" = "move container to workspace 4";
    #       "${mod}+Shift+5" = "move container to workspace 5";
    #       "${mod}+Shift+6" = "move container to workspace 6";
    #       "${mod}+Shift+7" = "move container to workspace 7";
    #       "${mod}+Shift+8" = "move container to workspace 8";
    #       "${mod}+Shift+9" = "move container to workspace 9";
    #       "${mod}+Shift+0" = "move container to workspace 10";

    #       ## MacroPad
    #       # Print, Pause, AudioRaiseVolume
    #       "Print" = "exec grimshot save area";
    #       "Pause" = "exec systemctl suspend";
    #       "XF86AudioRaiseVolume" =
    #         "exec ${pactl} set-sink-volume @DEFAULT_SINK@ +5%";
    #       # Tools, AudioMute, AudioLowerVolume
    #       "XF86Tools" = "exec ${lockCmd}";
    #       "XF86AudioMute" =
    #         "exec ${pactl} set-sink-mute @DEFAULT_SINK@ toggle";
    #       "XF86AudioLowerVolume" =
    #         "exec ${pactl} set-sink-volume @DEFAULT_SINK@ -5%";

    #       # AudioPrev, AudioPlay, AudioNext
    #       "XF86AudioNext" = "exec ${playerctl} next";
    #       "XF86AudioPlay" = "exec ${playerctl} play-pause";
    #       "XF86AudioPrev" = "exec ${playerctl} previous";

    #       # Laptop Brightness controll
    #       "XF86MonBrightnessUp" = "exec ${pkgs.brightnessctl}/bin/brightnessctl set +10%";
    #       "XF86MonBrightnessDown" = "exec ${pkgs.brightnessctl}/bin/brightnessctl set 10%-";

    #       # Lockscreen on laptop without macropad
    #       "Control+Escape" = "exec ${lockCmd}";

    #     };

    };
  };

}
