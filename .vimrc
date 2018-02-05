set nocp
set autochdir
filetype off
set t_Co=256
set lazyredraw
set ttyfast

set tags=./tags,tags;$HOME
set rtp+=~/.vim/bundle/Vundle.vim

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

call vundle#begin()
Plugin 'VundleVim/Vundle.Vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Xuyuanp/nerdtree-git-plugin'
"Plugin 'Valloric/YouCompleteMe'"
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'skywind3000/asyncrun.vim'
Plugin 'ternjs/tern'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'godlygeek/tabular'
Plugin 'moll/vim-node'
Plugin 'junegunn/seoul256.vim'
Plugin 'leafgarland/typescript-vim'
"Plugin 'Quramy/tsuquyomi'"
Plugin 'Quramy/vim-js-pretty-template'
Plugin 'jiangmiao/auto-pairs'
Plugin 'Yggdroot/indentLine'
Plugin 'nightsense/vim-crunchbang'
Plugin 'janko-m/vim-test'
Plugin 'vim-syntastic/syntastic'
Plugin 'powerman/vim-plugin-ruscmd'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'ctrlpvim/ctrlp.vim'
"Plugin 'davidhalter/jedi-vim'"
"Plugin 'lambdalisue/vim-pyenv'"
Plugin 'python-mode/python-mode'
call vundle#end()

syntax on
set background=dark
colorscheme crunchbang
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

"set expandtab"
"set shiftwidth=4"
"set softtabstop=4"
"set smartindent"

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

au BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix
"let g:pymode = 1"
"let g:jedi#force_py_version = 3"
"set omnifunc=jedi#completions"
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/"
