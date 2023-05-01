{pkgs, config, ...}:
{
    # Enable the X11 windowing system.
    services.xserver.enable = true;

    services.dbus.enable = true;
}
