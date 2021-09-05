set nocp
set autochdir
filetype off
set t_Co=256
set lazyredraw
set ttyfast
set nocursorline

set tags=./tags,tags;$HOME
set rtp+=/home/antonzub/fzf/bin/fzf

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
vnoremap <Up> <NOP>
vnoremap <Down> <NOP>
vnoremap <Left> <NOP>
vnoremap <Right> <NOP>
nnoremap <Space>w <C-w>
nnoremap <silent><Leader><C-]> <C-w><C-]>

tnoremap <Esc> <C-\><C-n>
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

call plug#begin('~/.local/share/nvim/plugged')
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'skywind3000/asyncrun.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'godlygeek/tabular'
Plug 'junegunn/seoul256.vim'
Plug 'Quramy/vim-js-pretty-template'
Plug 'Yggdroot/indentLine'
Plug 'nightsense/vim-crunchbang'
Plug 'jiangmiao/auto-pairs'
Plug 'majutsushi/tagbar'
Plug 'dyng/ctrlsf.vim'
Plug 'vim-syntastic/syntastic'
Plug 'powerman/vim-plugin-ruscmd'
Plug 'vim-scripts/indentpython.vim'
Plug 'pgdouyon/vim-evanesco'
Plug 'junegunn/fzf.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'vim-syntastic/syntastic'
Plug 'hrsh7th/nvim-compe'
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

call plug#end()

" nnoremap <Leader>gd <Plug>(lua vim.lsp.buf.definition())
" nnoremap <Leader>gt <Plug>(lua vim.lsp.buf.type_definition())
" nnoremap <Leader>gi <Plug>(lua vim.lsp.buf.implementation())
" nnoremap <Leader>gu <Plug>(lua vim.lsp.buf.references())
" nnoremap <Leader>gr <Plug>(lua vim.lsp.buf.rename())

lua << EOF
local nvim_lsp = require('lspconfig')
local compe = require('compe')

local servers = {"pyls", "ccls", "gopls"}

local on_attach = function(client, bufnr)

  print("LSP started.");
  -- require'completion'.on_attach(client)
  -- require'diagnostic'.on_attach(client)

  local opts = { noremap = true }

  vim.api.nvim_set_keymap('n','<Leader>gd','<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_set_keymap('n','<Leader>gt','<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_set_keymap('n','<Leader>gi','<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_set_keymap('n','<Leader>gu','<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_set_keymap('n','<Leader>gr','<cmd>lua vim.lsp.buf.rename()<CR>', opts)
end

vim.o.completeopt = "menuone,noselect"

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
 vim.lsp.diagnostic.on_publish_diagnostics, {
   underline = true,
   virtual_text = true,
 }
)

compe.setup{
    enabled = true;
    autocomplete = true;
    debug = false;
    min_length = 0;
    preselect = 'enable';
    throttle_time = 80;
    source_timeout = 200;
    incomplete_delay = 400;
    max_abbr_width = 100;
    max_kind_width = 100;
    max_menu_width = 100;
    documentation = true;

    source = {
        path = true;
        buffer = true;
        calc = true;
        nvim_lsp = true;
        nvim_lua = true;
        vsnip = true;
        ultisnips = true;
    };
} 

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
  root_dir = nvim_lsp.util.root_pattern('.git')
end

EOF

function! SetLSPHighlights()
    highlight LspDiagnosticsVirtualTextError ctermfg=160 ctermbg=236 guifg=#ff0000 guibg=#444444
    highlight LspDiagnosticsVirtualTextWarning ctermfg=173 ctermbg=236 guifg=#000000 guibg=#df5f00
    highlight LspDiagnosticsDefaultInformation guifg=yellow gui=bold,italic,underline
    highlight LspDiagnosticsDefaultHint ctermfg=179 ctermbg=236 guifg=#d7af5f guibg=#444444
    highlight LspDiagnosticsUnderlineError guifg=#EB4917 gui=undercurl
    highlight LspDiagnosticsUnderlineWarning guifg=#EBA217 gui=undercurl
    highlight LspDiagnosticsUnderlineInformation guifg=#17D6EB, gui=undercurl
    highlight LspDiagnosticsUnderlineHint guifg=#17EB7A gui=undercurl
endfunction

autocmd ColorScheme * call SetLSPHighlights()

syntax on
set background=dark
colorscheme seoul256

set number
set ruler
set rulerformat=%55(%{strftime('%a\ %b\ %e\ %I:%M\ %p')}\ %5l,%-6(%c%V%)\ %P%)
set laststatus=2
set clipboard=unnamedplus

set syn=auto 
set showmatch 
filetype on 
filetype plugin on 
filetype indent on 
set tabstop=4 
set softtabstop=4 
set shiftwidth=4 
set expandtab


map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let g:airline_powerline_fonts=1
let g:airline_theme='bubblegum'

nmap <F8> :TagbarToggle<CR>
map <C-f> :FZF<CR>

let g:syntastic_check_on_wq = 0


au BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix
let g:jedi#auto_vim_configuration = 1 
" let g:jedi#goto_definiton = "<leader>d"
"let g:jedi#goto_definitions_command = ''  " dynamically done for ft=python.
let g:jedi#show_call_signatures = 2
let g:jedi#use_tabs_not_buffers = 0  " current default is 1.
" let g:jedi#rename_command = '<Leader>gR'
" let g:jedi#usages_command = '<Leader>gu'
let g:jedi#completions_enabled = 0
let g:jedi#smart_auto_mappings = 1


inoremap <expr><tab> pumvisible() ? "\<c-n>" : "<Tab>"
inoremap <expr><S-tab> pumvisible() ? "\<c-p>" : "<S-Tab>"
set guicursor=
let g:NERDTreeWinSize=50

command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)

function! s:with_git_root()
  let root = systemlist('git rev-parse --show-toplevel')[0]
  return v:shell_error ? {} : {'dir': root}
endfunction

command! -bang -nargs=* Rag call fzf#vim#ag(<q-args>, extend(s:with_git_root(), {'options': '--delimiter : --nth 4..'}), <bang>0)

let g:syntastic_python_checkers = ['pylint']
