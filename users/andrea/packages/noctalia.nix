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
              enableColorization = true;
              colorizeSystemIcon = true;
            }
            {
              id = "SystemMonitor";
            }
            {
              id = "WiFi";
              displayMode = "alwaysShow";
            }
            {
              id = "Bluetooth";
            }
            {
              id = "VPN";
              displayMode = "alwaysShow";
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
        directory = "/home/andrea/Images/Wallpapers";
      };
      colorSchemes = {
        useWallpaperColors = true;
        matugenSchemeType = "scheme-fidelity";
      };
      appLauncher = {
        viewMode = "grid";
      };
    };
  };
}
