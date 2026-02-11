{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
      nvim-lspconfig
      nvim-cmp
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      cmp_luasnip
    ];

    initLua = ''
      -- ====== BASIC OPTIONS (lo que ya tenías) ======
      vim.o.tabstop = 4
      vim.o.shiftwidth = 4
      vim.o.softtabstop = 4
      vim.opt.breakindent = true
      vim.opt.cursorline = true
      vim.opt.scrolloff = 10
      vim.opt.relativenumber = true
      vim.opt.number = true

      -- ====== LSP: GOPLS (Neovim 0.11+) ======

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      vim.lsp.config("gopls", {
        capabilities = capabilities,
        settings = {
          gopls = {
            analyses = {
              unusedparams = true,
            },
            staticcheck = true,
          },
        },
      })

      vim.lsp.enable("gopls")

      -- ====== GO FORMAT ON SAVE (gofmt + goimports) ======

      -- Prefer goimports if gopls supports it
      vim.lsp.config("gopls", {
        settings = {
          gopls = {
            gofumpt = false,
            analyses = {
              unusedparams = true,
            },
            staticcheck = true,
            -- goimports is automatically used by gopls if present
          },
        },
      })

      -- Autoformat on save for Go files
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.go",
        callback = function()
          vim.lsp.buf.format({
            async = false,
            timeout_ms = 3000,
          })
        end,
      })

    '';
  };

}
