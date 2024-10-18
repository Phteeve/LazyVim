vim.api.nvim_exec(
  [[
  autocmd BufNewFile,BufRead *.ejs set filetype=html
  autocmd BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4
  autocmd BufNewFile,BufRead *.sql set filetype=sometype
  autocmd BufEnter,FocusGained * silent execute "!tmux rename-window " . expand('%:t')

  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
  autocmd FileType conf setlocal commentstring=#\ %s
  autocmd FileType hcl setlocal commentstring=#\ %s
  autocmd FileType nomad setlocal commentstring=#\ %s

  autocmd TabEnter * set foldcolumn=3
  autocmd InsertEnter * silent set nohlsearch
  autocmd BufEnter * silent !echo cd %:p:h > /tmp/lf.socket
  ]],
  false
)
