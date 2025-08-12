{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./git.nix
    ./starship.nix
    ./nvf.nix
  ];
}
