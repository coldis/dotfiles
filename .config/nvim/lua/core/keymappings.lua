local function nmap(key, cmd, opts) U.keymap.map('n', key, cmd, opts) end
local function imap(key, cmd, opts) U.keymap.map('i', key, cmd, opts) end
local function xmap(key, cmd, opts) U.keymap.map('x', key, cmd, opts) end
local function vmap(key, cmd, opts) U.keymap.map('v', key, cmd, opts) end
local function tmap(key, cmd, opts) U.keymap.map('t', key, cmd, opts) end
local function cmap(key, cmd) U.keymap.map('c', key, cmd, {silent = false}) end

vim.g.mapleader = ','
nmap('<leader>', '<Nop>')
xmap('<leader>', '<Nop>')

nmap('<leader>w', ':w<CR>')
nmap('<leader>wq', ':wq<CR>')
imap('jk', '<Esc>')
vmap('jk', '<Esc>')
--  'Zoom'. Open current buffer in a new tab.
nmap('<c-w>z', ':tabnew %<CR>')

-- Move from the neovim terminal window to somewhere else
tmap('<C-h>', '<C-\\><C-n><C-w>h')
tmap('<C-j>', '<C-\\><C-n><C-w>j')
tmap('<C-k>', '<C-\\><C-n><C-w>k')
tmap('<C-l>', '<C-\\><C-n><C-w>l')

-- Telescope
nmap('<c-p>',
     ':Telescope find_files find_command=rg,-i,--hidden,--files,-g,!.git<CR>')
nmap('<c-s>', ':Telescope buffers<CR>')
nmap('<c-c>', ':Telescope builtin<CR>')
nmap('<leader>g', ':Telescope live_grep<CR>')
nmap('<leader>d', ':Telescope lsp_document_diagnostics<CR>')

-- Git
nmap('gst', ':Neogit<CR>', {silent = true})

-- Nvim-Tree
nmap('<C-n>', ':NvimTreeToggle<CR>')

