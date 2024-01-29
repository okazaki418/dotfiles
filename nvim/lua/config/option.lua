-- 起動時メッセージの省略
vim.opt.shortmess:append({ I = true })
-- 行番号の表示
vim.opt.number = true
-- タブ文字をスペースに変更
vim.opt.expandtab = true
-- インデント量
vim.opt.softtabstop = 2
-- インデント移動量
vim.opt.shiftwidth = 2
-- タブ文字幅
vim.opt.tabstop = 2
-- 自動インデント
vim.opt.smartindent = true
-- カレントディレクトリの自動変更
vim.opt.autochdir = true
-- 文字コード
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.opt.fileencodings = 'utf-8,euc-jp,sjis'
-- 描画更新時間短縮
vim.opt.updatetime = 200
-- クリップボード
vim.opt.mouse:remove({ 'n', 'v', 'i', 'c' })
-- vim.opt.clipboard:append{'unnamedplus'}
-- ターミナル開いたら常にinsertモード
vim.cmd([[autocmd TermOpen * :startinsert]])
-- ターミナルで行番号非表示
vim.cmd([[autocmd TermOpen * :setlocal norelativenumber]])
vim.cmd([[autocmd TermOpen * :setlocal nonumber]])
