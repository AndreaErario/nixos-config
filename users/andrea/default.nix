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
    QT_QPA_PLATFORMTHEME = "gtk3";
  };

  home.pointerCursor = {
    name = "capitaine-cursors";
    package = pkgs.capitaine-cursors;
    gtk.enable = true;
  };

  home.file."/Images/Wallpapers/WALLPAPER.png".source = ./static/WALLPAPER.png;

  programs.bash.enable = true;
  programs.fish = {
    enable = true;
  };

  imports = [
    ./packages
  ];

  home.stateVersion = "24.11";
}
