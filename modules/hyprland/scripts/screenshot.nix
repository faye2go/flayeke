{
  pkgs,
}:

pkgs.writeShellScriptBin "screenshot" ''
  if pgrep slurp 
  then  
  pkill slurp 
  sleep 0.1
  fi

  ${pkgs.grim}/bin/grim  -g "$(${pkgs.slurp}/bin/slurp  -d)" - | ${pkgs.wl-clipboard}/bin/wl-copy &
''
