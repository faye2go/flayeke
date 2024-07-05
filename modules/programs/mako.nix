{
  pkgs,
  config,
  ...
}: let 
scheme = config.colorScheme.palette;
in {
  services.mako = {
    /* enable = true; 
    
    TODO something something swaync
    */
  };
}