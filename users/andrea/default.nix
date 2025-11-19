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

  programs.bash.enable = true;
  programs.fish = {
    enable = true;
  };

  imports = [
    ./packages
  ];

  home.stateVersion = "24.11";
}
