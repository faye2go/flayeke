{
  pkgs,
  config,
  ...
}: {
  programs.kitty = {
    enable = true;
    font.name = "JetBrainsMono Nerd Font";
    font.size = 12;
      settings = with config.colorScheme.palette; {
        foreground = "#${base05}";
        background = "#${base00}";
        background_opacity = "0.8";
      };
    };
  }