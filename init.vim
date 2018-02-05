set nocp
set autochdir
filetype off
set t_Co=256
set lazyredraw
set ttyfast

set tags=./tags,tags;$HOME

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

call plug#begin('~/.local/share/vim/plugged')
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
Plug 'ternjs/tern'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'godlygeek/tabular'
Plug 'moll/vim-node'
Plug 'junegunn/seoul256.vim'
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/vim-js-pretty-template'
Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'
Plug 'nightsense/vim-crunchbang'
Plug 'janko-m/vim-test'
Plug 'vim-syntastic/syntastic'
Plug 'powerman/vim-plugin-ruscmd'
Plug 'vim-scripts/indentpython.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-jedi'
Plug 'davidhalter/jedi-vim'
Plug 'lambdalisue/vim-pyenv'
call plug#end()

syntax on
set background=dark
colorscheme seoul256
if has('termguicolors')
    set termguicolors " 24-bit terminal
else
    let g:crunchbang_termcolors=256 " 256 color mode
endif

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

" let g:python2_host_prog = ''
" let g:python3_host_prog = ''

map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let g:airline_powerline_fonts=1
let g:airline_theme='bubblegum'

map <C-d> :TernDef<CR>
map <C-r> :TernRefs<CR>

let g:javascript_plugin_jsdoc = 1

let g:typescript_compiler_binary = "tsc"
let g:typescript_compiler_options = ''
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
autocmd CompleteDone * pclose
autocmd FileType typescript,html call angular_cli#init()
autocmd FileType typescript JsPreTmpl xml
autocmd FileType typescript syn clear foldBraces

""""""""""""""""""""""""""""""""
let test#strategy = "asyncrun"
let g:deoplete#enable_at_startup = 1

au BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix
let g:jedi#auto_vim_configuration = 0
let g:jedi#goto_definiton = "<leader>d"
"let g:jedi#goto_definitions_command = ''  " dynamically done for ft=python.
let g:jedi#show_call_signatures = 2
let g:jedi#use_tabs_not_buffers = 0  " current default is 1.
let g:jedi#rename_command = '<Leader>gR'
let g:jedi#usages_command = '<Leader>gu'
let g:jedi#completions_enabled = 0
let g:jedi#smart_auto_mappings = 1

" Unite/ref and pydoc are more useful.
let g:jedi#documentation_command = '<Leader>_K'
let g:jedi#auto_close_doc = 1
" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "<Tab>"


"let g:pymode = 1"
"let g:jedi#force_py_version = 3"
"set omnifunc=jedi#completions"
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/"
