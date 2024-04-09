{
  pkgs,
}:

pkgs.writeShellScriptBin "toggleBluetooth" ''
  if [[$(systemctl status bluetooth | grep "Status:") == "Status: Running"]] 
  then
    Systemctl stop bluetooth
  else
    Systemctl start bluetooth
  fi
''