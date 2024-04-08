{
  pkgs,
  config,
  ...
}: {
  programs.kitty = {
    enable = true;
      settings = {
        foreground = "#${config.colorScheme.palette.base05}";
        background = "#${config.colorScheme.palette.base00}";
        background_opacity = "0.5";
      };
    };
  }