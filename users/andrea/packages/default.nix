{
  config,
  pkgs,
  headless,
  ...
}: {
  imports =
    [
      ./git.nix
      ./starship.nix
      ./nvf.nix
    ]
    ++ (
      if !headless
      then [
        ./gtk.nix
        ./noctalia.nix
      ]
      else []
    );

  home.packages = with pkgs;
    [
      bat
      yazi
    ]
    ++ (
      if !headless
      then [
        swaybg
        orca-slicer
        discord
        rnote
      ]
      else []
    );
}
