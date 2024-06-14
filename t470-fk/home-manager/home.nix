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

  colorScheme = inputs.nix-colors.colorSchemes.catppuccin-frappe;
  
  home.username = "faye";
  home.homeDirectory = "/home/faye";

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    jdk
    tigervnc
    inkscape-with-extensions
    openscad-unstable
    prusa-slicer
    gnome.gnome-mines
    obsidian
    mako
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
    prismlauncher
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

  programs.zoxide.enable = true;
  programs.zoxide.enableZshIntegration = true;

  programs.bash.enable = true;
  
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
