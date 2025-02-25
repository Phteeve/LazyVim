return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
  dependencies = {
    { 'neovim/nvim-lspconfig' },   -- Required
    { 'williamboman/mason.nvim' }, -- Optional
    {
      'williamboman/mason-lspconfig.nvim',
      config = function()
        require('mason').setup {
          ensure_installed = { "eslint-lsp" },
        }
        require("mason-lspconfig").setup {
          ensure_installed = { "lua_ls", 'pyright' },
        }
      end
    }, -- Optional

    -- Autocompletion
    { 'hrsh7th/nvim-cmp' },     -- Required
    { 'hrsh7th/cmp-nvim-lsp' }, -- Required
    { 'hrsh7th/cmp-buffer' },   -- Required
    { 'L3MON4D3/LuaSnip' },     -- Required
    { 'saadparwaiz1/cmp_luasnip' },
    { 'jose-elias-alvarez/typescript.nvim' },
  },

  config = function()
    vim.diagnostic.config({
      virtual_text = true,
    })

    require('lspconfig').gopls.setup({
      settings = {
        gopls = {
          analyses = {
            unusedparams = true,
          },
          staticcheck = true,
          gofumpt = true,
        },
      },
    })

    require('lspconfig').ts_ls.setup({
      on_init = function(client)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentFormattingRangeProvider = false
      end,
    })

    require('lspconfig').eslint.setup({
      on_attach = function(client, bufnr)
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          command = "EslintFixAll",
        })
      end,
      root_dir = require('lspconfig').util.root_pattern("eslint.config.js", ".eslintrc.cjs", ".eslintrc.yaml", ".eslintrc.yml", ".eslintrc", ".git", "package.json"),
      settings = {
      }
     })

     require('lspconfig').pyright.setup({
        settings = {
          python = {
            analysis = {
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
            },
          },
        },

      })

      require('lspconfig').pylsp.setup({
          settings = {
              pylsp = {
                  plugins = {
                      pycodestyle = {
                          enabled = true,
                          ignore = {"E501", "E302"},
                          maxLineLength = 100,
                      },
                      yapf = { enabled = true },
                      pylint = { enabled = false },
                      flake8 = { enabled = false },
                      jedi_completion = { fuzzy = true },
                  },
              },
          },
          on_attach = function(client, bufnr)
              -- Enable formatting capabilities
              if client.server_capabilities.documentFormattingProvider then
                  vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>f", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", { noremap = true, silent = true })
              end

              -- Auto-format on save
              vim.api.nvim_create_autocmd("BufWritePre", {
                  buffer = bufnr,
                  callback = function()
                      vim.lsp.buf.format({ async = false })
                  end,
              })
          end,
      })

     require('lspconfig').omnisharp.setup({
            cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
            capabilities = require('cmp_nvim_lsp').default_capabilities(),
        })

    require('lspconfig').lua_ls.setup({
      settings = {
        Lua = {
          runtime = {
            version = 'LuaJIT',
          },
          diagnostics = {
            globals = { 'vim' },
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
          },
          telemetry = {
            enable = false,
          },
        },
      },
    })


    local cmp = require 'cmp'
    local luasnip = require 'luasnip'

    require('luasnip.loaders.from_snipmate').load({ path = { "/home/blk/git/dots/home/.config/nvim/snippets" } })

    cmp.setup({
      sources = {
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'nvim_lsp' },
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end
      },
      mapping = {
        ['<Tab>'] = cmp.mapping.confirm({ select = true }),
        ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
        ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
      }
    })
  end,
}

