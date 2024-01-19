local optl = vim.opt_local

-- 引用符
optl.comments = 'nb:>'

-- リスト（- / - [ ] / * / 1.）
optl.comments:append('b:- [ ],b:- [x],b:-')
optl.comments:append('b:*')
optl.comments:append('b:1.')

optl.formatoptions:remove('c')
optl.formatoptions:append('jro')
