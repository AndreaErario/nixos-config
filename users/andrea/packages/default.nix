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
        ./kitty.nix
      ]
      else []
    );

  home.packages = with pkgs;
    [
      bat
      yazi
      lazygit
    ]
    ++ (
      if !headless
      then [
        orca-slicer
        discord
        rnote
        solaar
        logseq
        yacreader
        inkscape
        freecad
      ]
      else []
    );
}
