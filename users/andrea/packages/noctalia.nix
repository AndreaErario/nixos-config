{
  config,
  pkgs,
  ...
}: {
  programs.noctalia-shell = {
    enable = true;
    settings = {
      bar = {
        density = "comfortable";
      };
      dock = {
        enabled = false;
      };
      location = {
        weatherEnabled = false;
      };
      wallpaper = {
        defaultWallpaper = "/home/andrea/Images/Wallpapers/WALLPAPER.png";
      };
      colorSchemes.useWallpaperColors = true;
    };
  };
}
