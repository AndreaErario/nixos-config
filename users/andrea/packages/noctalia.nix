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
        widgets = {
          left = [
            {
              id = "ControlCenter";
              useDistroLogo = true;
              colorizeDistroLogo = true;
            }
            {
              id = "SystemMonitor";
            }
            {
              id = "ActiveWindow";
            }
          ];
          right = [
            {
              id = "Tray";
            }
            {
              id = "Battery";
              displayMode = "alwaysShow";
            }
            {
              id = "Volume";
              displayMode = "alwaysShow";
            }
            {
              id = "Clock";
            }
            {
              id = "NotificationHistory";
            }
          ];
        };
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
