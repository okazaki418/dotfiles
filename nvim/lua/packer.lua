-- プラグインインストーラー
require('packer').startup(function(use) use 'wbthomason/packer.nvim'
  -- 軽量化
  use 'lewis6991/impatient.nvim'
  -- LSP設定補助
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig'
  -- 補完機能
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-cmdline'
  use 'onsails/lspkind.nvim'
  -- スニペット
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  -- use 'rafamadriz/friendly-snippets'
  -- モード表示（alacrittyと相性が悪い）

  -- use 'mvllow/modes.nvim'
  -- スクロールバー
  -- use 'petertriho/nvim-scrollbar'

  -- カラーコード着色
  use 'norcalli/nvim-colorizer.lua'
  -- tree-sitter
  use 'nvim-treesitter/nvim-treesitter'
  use 'p00f/nvim-ts-rainbow'
  -- 単語強調
  use 'RRethy/vim-illuminate'
  -- 括弧の突き合わせ
  use {'andymass/vim-matchup', event = 'User ActuallyEditing'}
  -- 括弧の自動補完
  use {'windwp/nvim-autopairs', config = function() require('nvim-autopairs').setup () end}
  -- コメントアウト補助
  use {'numToStr/Comment.nvim', config = function() require('Comment').setup() end}
  -- ファイラー
  use 'lambdalisue/fern.vim'
  use 'lambdalisue/nerdfont.vim'
  use 'lambdalisue/fern-renderer-nerdfont.vim'
  use 'lambdalisue/glyph-palette.vim'
  -- ファジーファインダー
  use {
    'nvim-telescope/telescope.nvim',
    requires = {'nvim-lua/plenary.nvim'},
    cmd = 'Telescope',
    module = 'telescope'
  }
  -- Gitクライアント
  use {'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim'}
  -- git diff
  use {'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim'}
  -- LSPの状態表示
  use {'j-hui/fidget.nvim', tag = 'legacy', config = function() require('fidget').setup() end, after = 'mason.nvim'}
  -- 翻訳
  use {'uga-rosa/translate.nvim', event = 'VimEnter'}
  -- ステータスバー
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons'},
    after = colorscheme
  }
  use {
    'akinsho/bufferline.nvim',
    after = colorscheme
  }
  -- テーマ
  use 'EdenEast/nightfox.nvim'
end)

-- 軽量化
require('impatient')

-- テーマ設定
vim.opt.termguicolors = true
vim.cmd 'colorscheme duskfox'

-- ステータスバーの設定
require('lualine').setup()
require('bufferline').setup {
  options = {
    separator_style = 'thick'
  },
  highlights = {
    buffer_selected = {
      italic = false
    }
  }
}

-- モード表示
-- require('modes').setup({
--   colors = {
--     copy = "#ffff00",
--     delete = "#ff0000",
--     insert = "#007fff",
--     visual = "#00ff00",
-- 	},
--   line_opacity = 0.1,
--   set_cursor = true,
--   set_cursorline = true,
--   set_number = true,
--   ignore_filetypes = { 'NvimTree', 'TelescopePrompt' }
-- })

-- スクロールバー
-- require("scrollbar").setup()

-- カラーコード着色
require("colorizer").setup()

-- tree-sitter
require('nvim-treesitter.configs').setup {
  ensure_installed = { "bash", "c", "cpp", "css", "html", "latex", "lua", "make"},
  highlights = {
    enable = true
  },
  -- nvim-ts-rainbow
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = 10000
  },
  -- vim-matchup
  matchup = {
    enable = true
  }
}

-- コメントアウト補助
require('Comment').setup()

-- 括弧自動補完
require('nvim-autopairs').setup()

-- 単語強調
require('illuminate').configure({
    providers = {
        'lsp',
        'treesitter',
        'regex',
    },
    delay = 100,
    filetype_overrides = {},
    filetypes_denylist = {
        'dirvish',
        'fugitive',
    },
    filetypes_allowlist = {},
    modes_denylist = {'v'},
    modes_allowlist = {},
    providers_regex_syntax_denylist = {},
    providers_regex_syntax_allowlist = {},
    under_cursor = true,
    large_file_cutoff = nil,
    large_file_overrides = nil,
    min_count_to_highlight = 1,
})
vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Visual" })
vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "Visual" })
vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Visual" })


-- 翻訳
require('translate').setup ({
  default = {
    command = 'google'
  },
  preset = {
    output = {
      split = {
        append = true
      }
    }
  }
})
vim.keymap.set('n', '<leader>t', ':Translate JA<CR>')
-- ファイラー
vim.cmd([[
  let g:fern#renderer = 'nerdfont'
  augroup my-glyph-palette
    autocmd! *
    autocmd FileType fern call glyph_palette#apply()
    autocmd FileType nerdtree,startify call glyph_palette#apply()
  augroup END
]])
vim.keymap.set('n', '<leader>e', ':Fern . -reveal=% -drawer -toggle -width=25<CR>', {silent = true})

-- ファジーファインダー
vim.keymap.set('n', '<leader>f', '<cmd>lua require(\'telescope.builtin\').find_files()<CR>', {noremap = true})
vim.keymap.set('n', '<leader>b', '<cmd>lua require(\'telescope.builtin\').buffers()<CR>', {noremap = true})

-- Gitクライアント
local neogit = require('neogit')
neogit.setup {}

-- LSP関連
local opt = {
  -- on_attach = function(client, bufnr)
  -- end
}

require('mason').setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

require('mason-lspconfig').setup()
require('mason-lspconfig').setup_handlers {
  function (server_name)
    require('lspconfig')[server_name].setup(opt)
  end,
}

-- 補完 & スニペット
vim.opt.completeopt = 'menu,menuone,noselect'

capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local lspkind = require('lspkind')
local luasnip = require('luasnip')

local cmp = require'cmp'
cmp.setup({
  formatting = {
    format = lspkind.cmp_format({
      with_text = true
    })
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
      ['<C-p>'] = cmp.mapping.select_prev_item(),
      ['<C-n>'] = cmp.mapping.select_next_item(),
      ['<C-l>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm { select = true },
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { 'i', 's' }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { 'i', 's' })
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' }
  }),
  experimental = {
    ghost_text = true,
  },
})

cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "path" },
    { name = "cmdline" }
  }
})

-- require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/luasnip/"})
