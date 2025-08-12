{
  config,
  pkgs,
  ...
}: {
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        treesitter.enable = true;
        git.enable = true;
        theme = {
          enable = true;
          name = "tokyonight";
          style = "moon";
        };
        lsp = {
          enable = true;
          formatOnSave = true;
        };
        languages = {
          nix = {
            enable = true;
            format.enable = true;
            lsp.enable = true;
          };
          markdown = {
            enable = true;
            lsp.enable = true;
            treesitter.enable = true;
            extensions.markview-nvim.enable = true;
          };
        };
      };
    };
  };
}
