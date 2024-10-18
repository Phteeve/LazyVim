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
          ensure_installed = { "eslint_d", "eslint-lsp" },
        }
        require("mason-lspconfig").setup {
          ensure_installed = { "lua_ls" },
        }
      end
    }, -- Optional

    -- Autocompletion
    { 'hrsh7th/nvim-cmp' },     -- Required
    { 'hrsh7th/cmp-nvim-lsp' }, -- Required
    { 'hrsh7th/cmp-buffer' },   -- Required
    { 'L3MON4D3/LuaSnip' },     -- Required
    { 'saadparwaiz1/cmp_luasnip' },
    -- { 'jose-elias-alvarez/typescript.nvim' },
    -- {
    --   "mfussenegger/nvim-lint",
    --   event = { "BufReadPre", "BufNewFile" },
    --   config = function()
    --     local lint = require("lint")
    --
    --     lint.linters_by_ft = {
    --       javascript = { "eslint" },
    --       typescript = { "eslint" },
    --       javascriptreact = { "eslint" },
    --       typescriptreact = { "eslint" },
    --     }
    --
    --     local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
    --
    --     vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
    --       group = lint_augroup,
    --       callback = function()
    --         lint.try_lint()
    --       end,
    --     })
    --   end,
    -- },
    -- { 'nvimtools/none-ls.nvim' },
    -- { 'MunifTanjim/eslint.nvim' }
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

    require('lspconfig').tsserver.setup({
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
      settings = {
        -- codeAction = {
        --   disableRuleComment = {
        --     enable = true,
        --     location = "separateLine"
        --   },
        --   showDocumentation = {
        --     enable = true
        --   }
        -- },
        -- codeActionOnSave = {
        --   enable = false,
        --   mode = "all"
        -- },
        -- experimental = {
        --   useFlatConfig = false
        -- },
        -- format = true,
        -- nodePath = "",
        -- onIgnoredFiles = "off",
        -- problems = {
        --   shortenToSingleLine = false
        -- },
        -- quiet = false,
        -- rulesCustomizations = {},
        -- run = "onType",
        -- useESLintClass = false,
        -- validate = "on",
        -- workingDirectory = {
        --   mode = "location"
        -- }
      }
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

