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

  " autocmd BufWritePre *.ts,*.tsx execute 'lua require("typescript").actions.addMissingImports({ sync = true })' | execute 'Prettier'
  " autocmd BufWritePre *.js,*.jsx,*.cjs,*.json,*.html execute 'Prettier'
  " autocmd BufEnter * silent! lcd %:p:h
  " autocmd FileType sql inoremap <buffer> <C-c> <Esc>
  " autocmd FocusGained,BufEnter * checktime
  " autocmd TermClose * setlocal statusline=%t%m | set foldcolumn=3 | stopinsert
  " autocmd TermOpen * setlocal statusline=%{b:term_title} | set foldcolumn=0
  " autocmd BufWinEnter,TermOpen,WinEnter term://* call SetTermPluginEnv()
  " autocmd FocusGained,BufWinEnter,BufEnter,WinEnter term://*tmux call EnterNormal()
  " autocmd BufWinEnter,TermOpen,WinEnter term://*tmux call SetTermEnv()

  " TRASH
  " command! -nargs=1 Edit edit %:h/<args>
  command! -nargs=+ Send :silent execute '!send '.<q-args>
  " cabbr e Edit
  cnoreabbrev Rename rename
  autocmd BufWritePre *.html execute 'lua vim.lsp.buf.format({ async = false })'
  " autocmd BufWritePre *.ts,*.tsx,*.js,*.jsx,*.json,*.html execute 'lua require("typescript").actions.addMissingImports({ async = false })' | execute 'lua vim.lsp.buf.format({ async = false })'
  " autocmd BufWritePre *.ts,*.tsx,*.js,*.jsx,*.json,*.html execute 'lua require("typescript").actions.addMissingImports({ async = false })' | execute 'lua vim.lsp.buf.format({ async = false })'
  " augroup FormatAutogroup
  "   autocmd!
  "   " autocmd User FormatterPre execute 'lua require("typescript").actions.addMissingImports({ async = false })'
  "   " autocmd User FormatterPre lua require("typescript").actions.addMissingImports({ async = false })
  "   autocmd BufWritePost *.ts,*.tsx,*.js,*.jsx,*.json,*.html FormatWrite
  " augroup END

  " autocmd BufNewFile,BufRead * set foldcolumn=3
  ]],
  false
)
