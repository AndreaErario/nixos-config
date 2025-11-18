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
      ]
      else []
    );
}
