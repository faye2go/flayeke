{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  
  imports = [
    inputs.nix-colors.homeManagerModules.default
    ./../../../modules/default.nix
  ]; 

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  home.username = "faye";
  home.homeDirectory = "/home/faye";

  home.packages = with pkgs; [
    josm
    python3
    python312Packages.chardet
    ffmpegthumbnailer
    orca-slicer
    zip
    rofi-wayland
    pipes-rs
    cmatrix
    imv
    mpv
    nemo
    ardour
    pwvucontrol
    cider
    cava
    jdk
    tigervnc
    inkscape-with-extensions
    openscad-unstable
    prusa-slicer
    gnome-mines
    obsidian
    mako
    brightnessctl
    mpd
    nerdfonts
    ocr-a
    jetbrains-mono
    iosevka
    material-design-icons 
    libreoffice
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

  colorScheme = inputs.nix-colors.colorSchemes.catppuccin-macchiato;

  home.file.".icons/default".source = "${pkgs.vanilla-dmz}/share/icons/Vanilla-DMZ-AA";
  
  fonts.fontconfig.enable = true;

  systemd.user.startServices = "sd-switch";

  home.stateVersion = "23.11";
}
