{
  pkgs,
  config,
  ...
}: let
scheme = config.colorScheme.palette;
in {
  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
  };
}