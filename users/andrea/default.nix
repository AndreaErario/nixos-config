{
  config,
  pkgs,
  ...
}: {
  home.username = "andrea";
  home.homeDirectory = "/home/andrea";

  home.sessionVariables = {
    EDITOR = "nvim";
    fish_greeting = "";
  };

  home.packages = with pkgs; [
    bat
    ranger
  ];

  programs.bash.enable = true;
  programs.fish = {
    enable = true;
  };

  imports = [
    ./programs
  ];

  home.stateVersion = "24.11";
}
