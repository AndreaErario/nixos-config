{
  config,
  pkgs,
  ...
}: let
  directory = "/home/andrea/Images/Wallpapers";
  wallpaper = "/WALLPAPER.png";
in {
  programs.noctalia = {
    enable = true;
    settings = {
      bar.default = {
        background_opacity = 0.80;
        capsule = true;
        margin_ends = 10;
        margin_edge = 5;
        start = ["control-center" "cpu" "temp" "ram" "network" "bluetooth"];
        center = ["launcher" "workspaces" "clipboard"];
        end = ["tray" "volume" "brightness" "battery" "clock" "notifications" "session"];
      };
      widget = {
        tray.drawer = true;
      };
      shell = {
        panel = {
          open_near_click_control_center = true;
        };
        font_family = "JetBrainsMono NF";
      };
      location = {
        auto_locate = true;
      };
      wallpaper = {
        directory = "${directory}";
        default = "${directory} + ${wallpaper}";
      };
      backdrop = {
        enabled = true;
      };
      theme = {
        mode = "dark";
        source = "wallpaper";
      };
      control_center = {
        sidebar_section = "none";
      };
    };
  };
}
