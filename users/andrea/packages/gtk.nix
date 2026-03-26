{
  config,
  pkgs,
  ...
}: {
  gtk = {
    enable = true;
    colorScheme = "dark";
    iconTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };
    gtk4.theme = null;
  };
}
