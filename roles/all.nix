{pkgs, config, ...}:
let
  consoleFont = hiDPI : if hiDPI then "Lat2-Terminus16" else "Lat2-Terminus20";
in
{
  imports = [
    ../modules/sound.nix
    ../modules/ssh.nix
  ];

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Locale
  i18n.defaultLocale = "de_DE.UTF-8";

  # List packages installed in system profile. To search, run:
  environment.systemPackages = with pkgs; [ vim wget curl git ];

  environment.variables = {
    EDITOR = "vim";
    DEFAULT_BROWSER = "${pkgs.firefox}/bin/firefox";

  };
  console = {
    font = "Lat2-Terminus16";
    keyMap = "de";
    # useXkbConfig = true;
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

}
