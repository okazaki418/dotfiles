-- leaderキーをSpaceに設定
vim.g.mapleader = " "
-- jjとjkkとkjでEsc
vim.keymap.set('i', 'jj', '<ESC>', { noremap = true, silent = true })
-- vim.keymap.set('t', 'jj', '<ESC>', { noremap = true, silent = true })
vim.keymap.set('i', 'jk', '<ESC>', { noremap = true, silent = true })
-- vim.keymap.set('t', 'jk', '<ESC>', { noremap = true, silent = true })
vim.keymap.set('i', 'kj', '<ESC>', { noremap = true, silent = true })
-- vim.keymap.set('t', 'kj', '<ESC>', { noremap = true, silent = true })
-- ;で:を入力
vim.keymap.set({ 'n', 'v' }, ';', ':', { noremap = true })
-- 検索ハイライトをEscで非表示
vim.keymap.set('n', '<ESC><ESC>', ':nohl<CR>', { noremap = true, silent = true })
-- leader+wでファイル保存
vim.keymap.set({ 'n', 'v' }, '<leader>w', ':w<CR>', { noremap = true })
-- leader+qで終了
vim.keymap.set({ 'n', 'v' }, '<leader>q', ':q<CR>', { noremap = true })
-- TerminalでEsc
vim.keymap.set('t', '<ESC>', '<C-\\><C-n>', { noremap = true, silent = true })
-- ttでターミナル起動
-- vim.keymap.set({'n', 'v'}, 'tt', '<cmd>belowright new<CR><cmd>terminal<CR><cmd>resize 10<CR>', { noremap = true, silent = true })
-- leader+fでフォーマット
vim.keymap.set('n', '<leader>f', function()
  vim.lsp.buf.format {
    timeout_ms = 200,
    async = true,
  }
end)
