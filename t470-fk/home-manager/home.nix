{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  
  imports = [
    inputs.nix-colors.homeManagerModules.default
    ./../../modules/default.nix
  ]; 

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  colorScheme = inputs.nix-colors.colorSchemes.catppuccin-macchiato;

  home.username = "faye";
  home.homeDirectory = "/home/faye";

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    brightnessctl
    mpd
    font-awesome
    jetbrains-mono
    iosevka
    material-design-icons 
    libreoffice
    wlogout
    wev
    bash
    playerctl
    networkmanagerapplet
    neovim
    hyprpaper
    swaybg
    swaynotificationcenter
    wpaperd
    mpvpaper
    swww
    libsForQt5.polkit-kde-agent
    xdg-desktop-portal-hyprland
    wireplumber
    pipewire
    libnotify
    psmisc
    wl-clipboard
    grim
    slurp
    element-desktop
    whatsapp-for-linux
    wofi
    waybar
    dolphin
    rclone
    steam 
    gnomeExtensions.burn-my-windows
    gnomeExtensions.desktop-cube
    gnomeExtensions.compiz-windows-effect
    firefox
    telegram-desktop
    signal-desktop
    vesktop
    spotify
    bitwarden
    krita
    prismlauncher-qt5
    hyfetch
    fastfetch
    vscodium
    jetbrains.idea-community
    tree
    kitty
  ];

  home.sessionVariables = {
    EDITOR = "nvim";  
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -l";
      cd = "z";
      update = "sudo nixos-rebuild --flake . switch";
    };
    history.size = 10000;
    history.path = "${config.xdg.dataHome}/zsh/history";
  };

  programs.zoxide.enable = true;
  programs.zoxide.enableZshIntegration = true;

  programs.starship.enable = true;

  programs.home-manager.enable = true;
  programs.git = {
    enable = true;
    userName = "Faye";
    userEmail = "fayeklass@outlook.com";
  };

  systemd.user.startServices = "sd-switch";

  home.stateVersion = "23.11";
}