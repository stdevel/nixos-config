{ pkgs, ... }: {
  users.users.christian = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "dialout"
    ];
    shell = pkgs.bash;
    hashedPassword = "$y$j9T$zyjvSwv.Lf4g8UMR4j6rW1$pzhgtm8CHxNQB4bIhbGUSteDqW9T/3Oz7G2ku69Dac6:19478";
  };
}
