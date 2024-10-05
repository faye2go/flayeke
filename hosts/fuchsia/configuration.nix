{
  inputs,
  lib,
  config,
  pkgs,
  outputs,
  ...
}: {
  imports = [
    inputs.hardware.nixosModules.common-cpu-intel
    inputs.hardware.nixosModules.common-pc-laptop-acpi_call
    inputs.home-manager.nixosModules.default

    ./hardware-configuration.nix
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; };
    users = {
      faye = import ./home-manager/home.nix;
    };
  };

  nixpkgs = {
    overlays = [
    ];
    config = {
      allowUnfree = true;
    };
  };

  nix.registry = (lib.mapAttrs (_: flake: {inherit flake;})) ((lib.filterAttrs (_: lib.isType "flake")) inputs);

  nix.nixPath = ["/etc/nix/path"];
  environment.etc =
    lib.mapAttrs'
    (name: value: {
      name = "nix/path/${name}";
      value.source = value.flake;
    })
    config.nix.registry;

  nix.settings = {
    experimental-features = "nix-command flakes";
    auto-optimise-store = true;
  };

  networking.hostName = "fuchsia";
  networking.networkmanager.enable = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true;
  };

  programs.git.enable = true;
  programs.neovim.enable = true;
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  services.xserver.enable = true;

  systemd.services.rclone-onedrive-mount = {
    wantedBy = [ "multi-user.target" ];
    after = [ "network-online.target" ];
    requires = [ "network-online.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStartPre = "/run/current-system/sw/bin/mkdir -p /home/faye/onedrive";
      ExecStart = "${pkgs.rclone}/bin/rclone mount onedrive: /home/faye/onedrive";
      ExecStop = "/run/current-system/sw/bin/fusermount -u /home/faye/onedrive";
      Restart = "on-failure";
      RestartSec = "10s";
      User = "faye";
      Group = "users";
      Environment = [ "PATH=/run/wrappers/bin/:$PATH" ];
    };
  };

    systemd.services.rclone-nextcloud-mount = {
    wantedBy = [ "multi-user.target" ];
    after = [ "network-online.target" ];
    requires = [ "network-online.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStartPre = "/run/current-system/sw/bin/mkdir -p /home/faye/cyber";
      ExecStart = "${pkgs.rclone}/bin/rclone mount cybercloud: /home/faye/cyber";
      ExecStop = "/run/current-system/sw/bin/fusermount -u /home/faye/cyber";
      Restart = "on-failure";
      RestartSec = "10s";
      User = "faye";
      Group = "users";
      Environment = [ "PATH=/run/wrappers/bin/:$PATH" ];
    };
  };

  services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.gdm.wayland = true;
  # services.xserver.desktopManager.gnome.enable = true;

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = inputs.hyprland.packages."${pkgs.system}".hyprland;
  };

  programs.steam = {
    enable = true;
  };

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };
  
  services.xserver.xkb.layout = "de";
  services.xserver.xkb.options = "eurosign:e";

  security.rtkit.enable = true;
  hardware.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
  hardware.bluetooth.enable = true;

  users.users = {
    faye = {
      isNormalUser = true;
      extraGroups = ["wheel"];
    };
  };

  time.timeZone = "Europe/Berlin";

  system.stateVersion = "23.11";
}
