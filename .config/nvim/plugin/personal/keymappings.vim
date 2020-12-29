let mapleader=','

" Quick save and exit
if !exists('g:vscode')
  nnoremap <leader>w :w<CR>
  nnoremap <leader>wq :wq<CR>
  " Get back to normal quickly
  inoremap jk <Esc>
  vnoremap jk <Esc>
  " 'Zoom'. Open current buffer in a new tab.
  nnoremap <c-w>z :tabnew %<CR>
else
  nnoremap <leader>w <Cmd>call VSCodeNotify('workbench.action.files.save')<CR>
endif

" Toggle paste mode
set pastetoggle=<F2>

if has('nvim')
  " Move from the neovim terminal window to somewhere else
  tnoremap <C-h> <C-\><C-n><C-w>h
  tnoremap <C-j> <C-\><C-n><C-w>j
  tnoremap <C-k> <C-\><C-n><C-w>k
  tnoremap <C-l> <C-\><C-n><C-w>l

  " Automatically enter/leave insert mode in terminal
  autocmd BufWinEnter,WinEnter term://* startinsert
  autocmd BufLeave term://* stopinsert
endif

