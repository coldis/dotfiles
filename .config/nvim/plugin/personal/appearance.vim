" Setup dark theme
set termguicolors
set background=dark
let g:one_allow_italics = 1
colorscheme one

" And light theme

syntax on " Enable syntax highlighting
set t_ZH=^[[3m " Enable italics
set t_ZR=^[[23m
set hls " Highlight search results
set cursorline " Highlight current line
set list listchars=tab:»\ ,trail:° " use » to mark Tabs and ° to mark trailing whitespace
set completeopt-=preview " Disable the preview window
set signcolumn=yes " Always draw the signcolumn.
set relativenumber " Relative numbers
if has('nvim')
  au TermOpen * setlocal nonumber norelativenumber signcolumn=no " Disable linenumbers in term
endif

