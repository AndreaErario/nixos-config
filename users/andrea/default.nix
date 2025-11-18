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

  home.pointerCursor = {
    name = "capitaine-cursors";
    package = pkgs.capitaine-cursors;
    gtk.enable = true;
  };

  home.packages = with pkgs; [
    bat
    yazi
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
