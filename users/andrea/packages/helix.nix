{
  config,
  pkgs,
  ...
}: {
  programs.helix = {
    enable = true;
    extraPackages = with pkgs; [
      # Nix
      nil
      alejandra
      # Python
      ruff
      black
    ];
    settings = {
      theme = "sonokai";
      editor = {
        indent-guides.render = true;
      };
    };
    languages = {
      language = [
        {
          name = "nix";
          formatter = {
            command = "alejandra";
          };
          auto-format = true;
        }
        {
          name = "python";
          formatter = {
            command = "black";
          };
          auto-format = true;
        }
      ];
    };
  };
}
