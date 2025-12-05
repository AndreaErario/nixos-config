{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"];

  boot = {
    plymouth.enable = true;
    consoleLogLevel = 3;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "udev.log_priority=3"
      "rd.systemd.show_status=auto"
    ];
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      timeout = null;
    };
  };

  networking.hostName = "dell14s";

  networking.networkmanager.enable = true;

  networking.firewall.checkReversePath = "loose";

  powerManagement = {
    enable = true;
    powertop.enable = true;
  };

  hardware.bluetooth.enable = true;

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
    ];
  };

  hardware.nvidia = {
    modesetting.enable = true;
    open = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:00:0";
    };
  };

  hardware.opentabletdriver.enable = true;

  hardware.logitech.wireless.enable = true;

  time.timeZone = "Europe/Rome";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "it_IT.UTF-8";
    LC_IDENTIFICATION = "it_IT.UTF-8";
    LC_MEASUREMENT = "it_IT.UTF-8";
    LC_MONETARY = "it_IT.UTF-8";
    LC_NAME = "it_IT.UTF-8";
    LC_NUMERIC = "it_IT.UTF-8";
    LC_PAPER = "it_IT.UTF-8";
    LC_TELEPHONE = "it_IT.UTF-8";
    LC_TIME = "it_IT.UTF-8";
  };

  services.xserver = {
    xkb = {
      layout = "us";
      variant = "intl";
    };
    videoDrivers = [
      "modesetting"
      "nvidia"
    ];
  };

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --user-menu --cmd niri-session";
        user = "greeter";
      };
    };
  };

  services.openssh.enable = true;

  services.udisks2.enable = true;

  services.power-profiles-daemon.enable = true;

  services.thermald.enable = true;

  services.upower.enable = true;

  services.gvfs.enable = true;

  xdg.portal = {
    xdgOpenUsePortal = true;
    wlr.enable = true;
    extraPortals = with pkgs; [xdg-desktop-portal-gtk xdg-desktop-portal-gnome];
  };

  users.users.andrea = {
    isNormalUser = true;
    description = "Andrea Erario";
    shell = pkgs.fish;
    extraGroups = ["networkmanager" "wheel"];
    packages = with pkgs; [];
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    vim
    git
    alacritty
    firefox
    xwayland-satellite
    nautilus
    htop
    udiskie
    lshw
    inputs.noctalia.packages.${stdenv.hostPlatform.system}.default
    kdePackages.okular
    brightnessctl
    playerctl
    wireguard-tools
    vlc
  ];

  programs.niri.enable = true;

  programs.gnupg = {
    agent = {
      enable = true;
      enableSSHSupport = true;
      pinentryPackage = pkgs.pinentry-curses;
    };
  };

  programs.fish.enable = true;

  programs.localsend.enable = true;

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  system.stateVersion = "25.05";
}
