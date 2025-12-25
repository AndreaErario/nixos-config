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
              showMemoryAsPercent = true;
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
          center = [
            {
              id = "TaskbarGrouped";
              hideUnoccupied = true;
              labelMode = "none";
            }
          ];
          right = [
            {
              id = "Tray";
            }
            {
              id = "Battery";
              displayMode = "alwaysShow";
              warningThreshold = 20;
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
        firstDayOfWeek = 1;
      };
      wallpaper = {
        directory = "/home/andrea/Images/Wallpapers";
        overviewEnabled = true;
      };
      colorSchemes = {
        useWallpaperColors = true;
        matugenSchemeType = "scheme-fidelity";
      };
      appLauncher = {
        viewMode = "grid";
      };
      ui = {
        fontDefault = "Roboto Medium";
        fontFixed = "JetBrainsMono Nerd Font";
      };
      osd = {
        enabledTypes = [0 1 2 3];
      };
    };
  };
}
