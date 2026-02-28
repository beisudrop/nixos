{ pkgs, ... }:
{

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    viAlias = true;
    plugins = with pkgs.vimPlugins; [
      transparent-nvim
      nvim-treesitter
      telescope-nvim
      yazi-nvim
      nvim-lspconfig
      nvim-cmp
      cmp-nvim-lsp
      luasnip
      cmp_luasnip
    ];
    extraConfig = ''
      set clipboard+=unnamedplus 
    '';
    initLua = ''
      -- nvim-cmp setup (needs nvim-cmp, cmp-nvim-lsp, and a snippet source installed as plugins)
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"]      = cmp.mapping.confirm({ select = true }),
          ["<Tab>"]     = cmp.mapping.select_next_item(),
          ["<S-Tab>"]   = cmp.mapping.select_prev_item(),
        }),
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
        },
      })

      -- capabilities for completion
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

      -- define the nil_ls config
      vim.lsp.config("nil_ls", {
        capabilities = capabilities,
        settings = {
          ["nil"] = {
            formatting = {
              command = { "nixfmt" },
            },
          },
        },
      })

      -- enable nil_ls so it attaches to Nix buffers
      vim.lsp.enable("nil_ls")

      -- format on save for Nix files
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.nix",
        callback = function()
          vim.lsp.buf.format()
        end,
      })

      -- diagnostics look nicer
      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
      })

      -- map a key to open yazi.nvim
      vim.keymap.set("n", "<leader>-", function()
        require("yazi").yazi()
      end)

      -- 👇 if you use `open_for_directories=true`, this is recommended.
      --
      -- mark netrw as loaded so it's not loaded at all.
      -- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
      vim.g.loaded_netrwPlugin = 1
      vim.api.nvim_create_autocmd("UIEnter", {
        callback = function()
          require("yazi").setup({
            open_for_directories = true,
          })
        end,
      })

      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
    '';
  };
}
