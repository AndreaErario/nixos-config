{
  config,
  pkgs,
  ...
}: {
  programs.kitty = {
    enable = true;
    font = {
      name = "JetbrainsMono Nerd Font";
    };
    themeFile = "Doom_Vibrant";
  };
}
