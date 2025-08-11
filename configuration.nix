{ config, lib, pkgs, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  networking.hostName = "wsl";

  time.timeZone = "Europe/Rome";

  environment.systemPackages = with pkgs; [
    git
    htop
    fastfetch
    tree
  ];

  services.openssh.enable = true;

  programs.gnupg = {
    agent = {
      enable = true;
      enableSSHSupport = true;
      pinentryPackage = pkgs.pinentry-curses;
    };
  };

  programs.fish.enable = true;

  users.users.andrea = {
    isNormalUser = true;
    home = "/home/andrea";
    shell = pkgs.fish;
    description = "Andrea Erario";
    extraGroups = [ "wheel" "networkmanager" ];
  };
}

