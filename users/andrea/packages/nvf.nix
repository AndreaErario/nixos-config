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
        ui = {
          noice.enable = true;
        };
        statusline = {
          lualine.enable = true;
        };
        lsp = {
          enable = true;
          formatOnSave = true;
        };
        diagnostics = {
          enable = true;
          config = {
            virtual_lines = true;
          };
        };
        filetree = {
          neo-tree.enable = true;
        };
        telescope.enable = true;
        autocomplete = {
          nvim-cmp.enable = true;
        };
        autopairs = {
          nvim-autopairs.enable = true;
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
          clang = {
            enable = true;
            lsp = {
              enable = true;
              servers = ["ccls"];
            };
          };
          python = {
            enable = true;
            format.enable = true;
            lsp = {
              enable = true;
              servers = ["pyright"];
            };
          };
        };
      };
    };
  };
}
