{
  pkgs,
  config,
  ...
}: {
  programs.ranger = {
    enable = true;

    settings = {
      draw_borders = "outline";
      tilde_in_titlebar = true;
      wrap_scroll = true;
      preview_images_method = "kitty";
    };
  };
}