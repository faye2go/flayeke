{
  pkgs,
  config,
  ...
}: let 
scheme = config.colorScheme.palette;
in {
  services.mako = {
    /* enable = true; 
    
    trying to do something with swaync*/
  };
}