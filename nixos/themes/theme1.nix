# theme1.nix
{ 
  pkgs,
  config,
  ...
   }:
let
  nix-colors = import <nix-colors> { };
in {
  import = [
    nix-colors.homeManagerModules.default
  ];

  colorScheme = nix-colors.colorSchemes.dracula;

}