{ config, pkgs, ... }:

{
  home.username = "andrea";
  home.homeDirectory = "/home/andrea";

  home.sessionVariables = {
    EDITOR = "nvim";
    fish_greeting = "";
  };

  home.packages = with pkgs; [
    neovim
    bat
    ranger
  ]; 

  programs.fish = {
    enable = true;
  };

  imports = [
    ./programs
  ];

  home.stateVersion = "24.11";
}

