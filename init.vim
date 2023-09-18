filetype off
set t_Co=256
set lazyredraw
set ttyfast
set nocursorline


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
Plug 'skywind3000/asyncrun.vim' " TODO: read about async tasks in neovim
Plug 'AndrewRadev/splitjoin.vim'
Plug 'godlygeek/tabular'
Plug 'Yggdroot/indentLine'
Plug 'jiangmiao/auto-pairs'
Plug 'majutsushi/tagbar'
Plug 'powerman/vim-plugin-ruscmd'
Plug 'vim-scripts/indentpython.vim'
Plug 'pgdouyon/vim-evanesco'
Plug 'dense-analysis/ale'
Plug 'vim-test/vim-test'
Plug 't9md/vim-choosewin'

Plug 'christoomey/vim-tmux-navigator'
Plug 'michaelb/sniprun', {'do': 'sh install.sh'}

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'


" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

Plug 'junegunn/goyo.vim'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

set completeopt=menu,menuone,noselect

lua << EOF
  local nvim_lsp = require('lspconfig')
  local cmp = require('cmp')
  local cmp_nvim_lsp = require('cmp_nvim_lsp')
  local luasnip = require('luasnip')

  cmp.setup {
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    mapping = {
      ['<C-p>'] = cmp.mapping.select_prev_item(),
      ['<C-n>'] = cmp.mapping.select_next_item(),
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      },
      ['<Tab>'] = function(fallback)
        if luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif cmp.visible() then
          cmp.select_next_item()
        else
          fallback()
        end
      end,
      ['<S-Tab>'] = function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end,
    },
    sources = {
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
    },
  }

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
    }, {
      { name = 'cmdline' }
    })
  })


  local border = {
      {"╔", "FloatBorder"},
      {"═", "FloatBorder"},
      {"╗", "FloatBorder"},
      {"║", "FloatBorder"},
      {"╝", "FloatBorder"},
      {"═", "FloatBorder"},
      {"╚", "FloatBorder"},
      {"║", "FloatBorder"}
  }
  vim.diagnostic.config({
    underline = false,
    virtual_text = false, -- Turn off inline diagnostics
    float = {
      border = border,
      source = "always",
      update_in_insert = true
      },
  })

  vim.o.updatetime = 250
  vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
  vim.cmd [[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]

  local on_attach = function(client, bufnr)

    print("LSP started.");

    local opts = { noremap = true }

    vim.api.nvim_set_keymap('n','<Leader>gd','<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_set_keymap('n','<Leader>gt','<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    vim.api.nvim_set_keymap('n','<Leader>gi','<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    vim.api.nvim_set_keymap('n','<Leader>gu','<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_set_keymap('n','<Leader>gr','<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  end

  local servers = {"ccls", "gopls", "pylsp", "rust_analyzer", "terraformls"}

  for _, server in pairs(servers) do
    local capabilities = cmp_nvim_lsp.default_capabilities (vim.lsp.protocol.make_client_capabilities())
    nvim_lsp[server].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }
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


au BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=120 expandtab autoindent fileformat=unix

set guicursor=
let g:NERDTreeWinSize=40

function! s:with_git_root()
  let root = systemlist('git rev-parse --show-toplevel')[0]
  return v:shell_error ? {'dir': '.'} : {'dir': root}
endfunction

command! -bang -nargs=* Rag call fzf#vim#ag(<q-args>, extend(s:with_git_root(), {'options': ['--delimiter', 'nth 4..', '--info=inline', '--preview', 'cat {}']}), <bang>0)
command! -bang -nargs=* Ctrlp call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

let test#strategy = 'neovim'
let g:test#neovim#start_normal = 1
let test#python#runner = 'pytest'
let test#python#pytest#options = '-s'
let test#project_root = s:with_git_root()['dir']

nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

nmap <F8> :TagbarToggle<CR>
map <C-f> :Rag<CR>
map <C-P> :Ctrlp<CR>


" Check if NERDTree is open or active
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

function! CheckIfCurrentBufferIsFile()
  return strlen(expand('%')) > 0
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && CheckIfCurrentBufferIsFile() && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufRead * call SyncTree()

function! ToggleTree()
  if CheckIfCurrentBufferIsFile()
    if IsNERDTreeOpen()
      NERDTreeClose
    else
      NERDTreeFind
    endif
  else
    NERDTree
  endif
endfunction

" open NERDTree with ctrl + n
nmap <C-n> :call ToggleTree()<CR>
let g:choosewin_overlay_enable = 1
nmap - <Plug>(choosewin)

nnoremap <silent> <C-k> :bnext<CR>:call SyncTree()<CR>
nnoremap <silent> <C-j> :bprev<CR>:call SyncTree()<CR>
nnoremap <silent> <F2> :NERDTreeToggle<cr><c-w>l:call SyncTree()<cr><c-w>h
