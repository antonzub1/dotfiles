-- Set filetype detection off
vim.opt.filetype = 'off'
--
-- Disable terminal color support to 256 colors
vim.opt.termguicolors = false

-- Enable lazyredraw
vim.opt.lazyredraw = true

-- Enable fast terminal mode
vim.opt.ttyfast = true

-- Disable cursorline
vim.opt.cursorline = false

vim.opt.guicursor = ""

-- Set tags search path
vim.opt.tags:append('./tags')
vim.opt.tags:append('tags;$HOME')

-- Set line numbers and ruler
vim.opt.number = true
vim.opt.ruler = true

-- Set custom ruler format
vim.opt.rulerformat = '%55(%{strftime(\"%a %b %e %I:%M %p\")} %5l,%-6(%c%V%) %P%)'

-- Always show status line
vim.opt.laststatus = 2

-- Enable system clipboard integration
vim.opt.clipboard = 'unnamedplus'

-- Set syntax highlighting to auto
vim.opt.syntax = 'auto'

-- Show matching brackets
vim.opt.showmatch = true

-- Set tab settings
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true


-- Enable syntax highlighting
vim.cmd('syntax on')

-- Set background to dark
vim.g.background = 'light'

vim.g.seoul256_sgrb = 0

-- Set the background color for seoul256 color scheme
vim.g.seoul256_background = 237


-- Testing configuration
vim.g.test_strategy = 'neovim'
vim.g.test_neovim_start_normal = 1
vim.g.test_python_runner = 'pytest'
vim.g.test_python_pytest_options = '-s'
vim.g.test_project_root = vim.fn.getcwd()

vim.opt.guicursor = ''

-- Configuration for Python files
vim.cmd([[
  augroup PythonSettings
    autocmd!
    autocmd BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=120 expandtab autoindent fileformat=unix
  augroup END
]])

-- Disable arrow keys in normal, insert, and visual modes
vim.api.nvim_set_keymap('n', '<Up>', '<NOP>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Down>', '<NOP>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Left>', '<NOP>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Right>', '<NOP>', { noremap = true })

vim.api.nvim_set_keymap('i', '<Up>', '<NOP>', { noremap = true })
vim.api.nvim_set_keymap('i', '<Down>', '<NOP>', { noremap = true })
vim.api.nvim_set_keymap('i', '<Left>', '<NOP>', { noremap = true })
vim.api.nvim_set_keymap('i', '<Right>', '<NOP>', { noremap = true })

vim.api.nvim_set_keymap('v', '<Up>', '<NOP>', { noremap = true })
vim.api.nvim_set_keymap('v', '<Down>', '<NOP>', { noremap = true })
vim.api.nvim_set_keymap('v', '<Left>', '<NOP>', { noremap = true })
vim.api.nvim_set_keymap('v', '<Right>', '<NOP>', { noremap = true })

-- Map Leader+C-] in normal mode
vim.api.nvim_set_keymap('n', '<silent><Leader><C-]>', '<C-w><C-]>', { noremap = true })

-- Terminal mode mappings
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true })
vim.api.nvim_set_keymap('t', '<A-h>', '<C-\\><C-N><C-w>h', { noremap = true })
vim.api.nvim_set_keymap('t', '<A-j>', '<C-\\><C-N><C-w>j', { noremap = true })
vim.api.nvim_set_keymap('t', '<A-k>', '<C-\\><C-N><C-w>k', { noremap = true })
vim.api.nvim_set_keymap('t', '<A-l>', '<C-\\><C-N><C-w>l', { noremap = true })

vim.api.nvim_set_keymap('i', '<A-h>', '<C-\\><C-N><C-w>h', { noremap = true })
vim.api.nvim_set_keymap('i', '<A-j>', '<C-\\><C-N><C-w>j', { noremap = true })
vim.api.nvim_set_keymap('i', '<A-k>', '<C-\\><C-N><C-w>k', { noremap = true })
vim.api.nvim_set_keymap('i', '<A-l>', '<C-\\><C-N><C-w>l', { noremap = true })

vim.api.nvim_set_keymap('n', '<A-h>', '<C-w>h', { noremap = true })
vim.api.nvim_set_keymap('n', '<A-j>', '<C-w>j', { noremap = true })
vim.api.nvim_set_keymap('n', '<A-k>', '<C-w>k', { noremap = true })
vim.api.nvim_set_keymap('n', '<A-l>', '<C-w>l', { noremap = true })

-- Mappings for testing
vim.api.nvim_set_keymap('n', '<silent> t<C-n>', ':TestNearest<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<silent> t<C-f>', ':TestFile<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<silent> t<C-s>', ':TestSuite<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<silent> t<C-l>', ':TestLast<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<silent> t<C-g>', ':TestVisit<CR>', { noremap = true })

-- Mappings for Ag and Ctrlp
vim.api.nvim_set_keymap('n', '<C-f>', ':Ag<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-P>', ':CtrlP<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-n>', ':NERDTreeToggle<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-b>', ':Buffers<CR>', { noremap = true })

-- Mappings for Choosewin
vim.api.nvim_set_keymap('n', '-', '<Plug>(choosewin)', {})

-- Mappings for Outline
vim.api.nvim_set_keymap('n', '<leader>o', '<cmd>Outline<CR>', { noremap = true })

vim.cmd("command! -bang -nargs=* Ag call fzf#vim#ag(" ..
            "<q-args>," ..
            "fzf#vim#with_preview({'options': ['--delimiter', 'nth 4..', '--info=inline', '--layout=reverse']}), <bang>0)")
vim.cmd("command! -bang -nargs=* CtrlP call fzf#vim#files(" ..
            "<q-args>," ..
            "fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)")
vim.cmd("command! -bang -nargs=* Buffers call fzf#vim#buffers(" ..
            "<q-args>," ..
            "fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)")

local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.local/share/nvim/plugged')
Plug ('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })

Plug ('nvim-lua/plenary.nvim')
Plug ('nvim-telescope/telescope.nvim')

Plug ('antonzub1/lualine.nvim')
Plug ('Xuyuanp/nerdtree-git-plugin')
Plug ('easymotion/vim-easymotion')
Plug ('tpope/vim-repeat')
Plug ('tpope/vim-speeddating')
Plug ('tpope/vim-surround')
Plug ('tpope/vim-commentary')
Plug ('tpope/vim-fugitive')
Plug ('AndrewRadev/splitjoin.vim')
Plug ('godlygeek/tabular')
Plug ('Yggdroot/indentLine')
Plug ('jiangmiao/auto-pairs')
Plug ('majutsushi/tagbar')
Plug ('powerman/vim-plugin-ruscmd')
Plug ('vim-scripts/indentpython.vim')
Plug ('pgdouyon/vim-evanesco')
Plug ('vim-test/vim-test')
Plug ('t9md/vim-choosewin')

Plug ('christoomey/vim-tmux-navigator')
Plug ('michaelb/sniprun', { ['do'] = 'sh install.sh' })

-- Appearance, tools
Plug ('junegunn/goyo.vim')
Plug ('junegunn/seoul256.vim')
Plug ('junegunn/fzf', { ['do'] =  './install --bin' } )
Plug ('junegunn/fzf.vim')
Plug ('hedyhli/outline.nvim')
Plug ('preservim/nerdtree')

-- LSP plugins
Plug ('neovim/nvim-lspconfig')
Plug ('hrsh7th/cmp-nvim-lsp')
Plug ('hrsh7th/cmp-buffer')
Plug ('hrsh7th/cmp-path')
Plug ('hrsh7th/cmp-cmdline')
Plug ('hrsh7th/nvim-cmp')

Plug ('stevearc/overseer.nvim')

-- Debugging
Plug ('mfussenegger/nvim-dap')
Plug ('mfussenegger/nvim-dap-python')
Plug ('nvim-neotest/nvim-nio')
Plug ('rcarriga/nvim-dap-ui')

-- For vsnip users.
Plug ('hrsh7th/cmp-vsnip')
Plug ('hrsh7th/vim-vsnip')
Plug ('L3MON4D3/LuaSnip')
Plug ('saadparwaiz1/cmp_luasnip')

-- AI
Plug ('greggh/claude-code.nvim')

vim.call('plug#end')

vim.o.completeopt = 'menu,menuone,noselect'

-- local nvim_lsp = require("lsp_config")
local cmp = require('cmp')
local cmp_nvim_lsp = require('cmp_nvim_lsp')
local luasnip = require('luasnip')

require('overseer').setup()
require('lualine').setup {
    options = { theme = "bubblegum" }
}

cmp.setup {
  formatting = {
    fields = { "abbr", "menu", "kind" },
    format = function(entry, item)
      -- Define menu shorthand for different completion sources.
      local menu_icon = {
        nvim_lsp = "[LSP]",
        nvim_lua = "[LUA]",
        luasnip  = "[SNIP]",
        buffer   = "[BUFF]",
        path     = "[PATH]",
      }
          -- Set the menu "icon" to the shorthand for each completion source.
      item.menu = menu_icon[entry.source.name]

      -- Set the fixed width of the completion menu to 60 characters.
      -- fixed_width = 60
      width_percent = 0.2

      -- Set 'fixed_width' to false if not provided.
      fixed_width = fixed_width or false

      -- Get the completion entry text shown in the completion window.
      local content = item.abbr

      -- Set the fixed completion window width.
      if fixed_width then
          vim.o.pumwidth = fixed_width
      end

      -- Get the width of the current window.
      local win_width = vim.api.nvim_win_get_width(0)

      -- Set the max content width based on either: 'fixed_width'
      -- or a percentage of the window width, in this case 20%.
      -- We subtract 10 from 'fixed_width' to leave room for 'kind' fields.
      local max_content_width = fixed_width and fixed_width - 10 or math.floor(win_width * width_percent)

      -- Truncate the completion entry text if it's longer than the
      -- max content width. We subtract 3 from the max content width
      -- to account for the "..." that will be appended to it.
      if #content > max_content_width then
        item.abbr = vim.fn.strcharpart(content, 0, max_content_width - 3) .. "..."
      else
        item.abbr = content .. (" "):rep(max_content_width - #content)
        end
        return item
      end,
  },
  window = {
    completion = {
      winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:CmpItemKindMethod,Search:None",
      },
  },
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
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
      mapping = cmp.mapping.preset.cmdline(),
      name = "path",
  }, {
    { name = 'cmdline' }
  })
})


vim.fn.sign_define("DiagnosticSignError", {text = "", texthl = "DiagnosticSignError", linehl="", numhl="DiagnosticSignError"})
vim.fn.sign_define("DiagnosticSignWarn", {text = "", texthl = "DiagnosticSignWarn", linehl="", numhl="DiagnosticSignWarn"})
vim.fn.sign_define("DiagnosticSignInformation", {text = "", texthl = "DiagnosticSignInformation", linehl="", numhl="DiagnosticSignInformation"})
vim.fn.sign_define("DiagnosticSignHint", {text = "", texthl = "DiagnosticSignHint", linehl="", numhl="DiagnosticSignHint"})

vim.diagnostic.config({
  underline = true,
  virtual_text = false,
  float = {
    style = "minimal",
    border = "single",
    source = "always",
    update_in_insert = false,
    severity_sort = true,
  },
})


vim.o.updatetime = 250
vim.cmd [[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]
vim.api.nvim_create_autocmd({ "CursorHold" }, {
  group = vim.api.nvim_create_augroup("float_diagnostic_cursor", { clear = true }),
  callback = function ()
    vim.diagnostic.open_float(nil, {focus=false, scope="cursor", max_width=80})
  end
})

local on_attach = function(client, bufnr)
  local opts = { noremap = true }

  vim.api.nvim_set_keymap('n', '<Leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_set_keymap('n', '<Leader>gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_set_keymap('n', '<Leader>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_set_keymap('n', '<Leader>gu', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_set_keymap('n', '<Leader>gr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_set_keymap('n', '<Leader>gh', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)

  print("LSP started.");
end

local servers = {
    "ccls",
    "gopls",
    "lua_ls",
    "pylsp",
    "rust_analyzer",
    "terraformls",
    "ts_ls",
}

for _, server in pairs(servers) do
  local capabilities = cmp_nvim_lsp.default_capabilities (vim.lsp.protocol.make_client_capabilities())
  vim.lsp.config(server, {
      capabilities = capabilities,
      on_attach = on_attach,
  })
  vim.lsp.enable(server, {})

end

-- DAP Configuration
local dap = require("dap")
dap.adapters["rust-gdb"] = {
  type = "executable",
  command = "rust-gdb",
  args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
}
dap.configurations.rust = {
  {
    name = "Launch",
    type = "rust-gdb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    args = {}, -- provide arguments if needed
    cwd = "${workspaceFolder}",
    stopAtBeginningOfMainSubprogram = false,
  },
  {
    name = "Select and attach to process",
    type = "rust-gdb",
    request = "attach",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    pid = function()
      local name = vim.fn.input('Executable name (filter): ')
      return require("dap.utils").pick_process({ filter = name })
    end,
    cwd = "${workspaceFolder}"
  },
  {
    name = "Attach to gdbserver :1234",
    type = "rust-gdb",
    request = "attach",
    target = "localhost:1234",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}'
  }
}

vim.cmd('colorscheme seoul256')

vim.api.nvim_set_hl(0, 'CmpItemKind', { fg='#949494', ctermfg=248 })

vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})


vim.keymap.set({"i", "s"}, "<C-E>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {silent = true})

require("outline").setup({})
local dap_python = require("dap-python")
dap_python.setup("uv")


local dapui = require("dapui")
-- nvim dap mappings
vim.keymap.set('n', '<Leader>db',  function() dap.toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>dc',  function() dap.continue() end)
vim.keymap.set('n', '<Leader>do',  function() dap.step_over() end)
vim.keymap.set('n', '<Leader>di',  function() dap.step_into() end)
vim.keymap.set('n', '<Leader>du',  function() dap.step_out() end)
vim.keymap.set('n', '<Leader>dq',  function() dap.quit() dapui.close() end)
vim.keymap.set('n', '<Leader>dlb',  function() dap.list_breakpoints() end)
vim.keymap.set('n', '<Leader>dt', function() dap_python.test_method() end)

dapui.setup()

dap.listeners.before.attach.dapui_config = function()
	dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
	dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	dapui.close()
end

-- close Dap UI with :DapCloseUI
vim.api.nvim_create_user_command("DapCloseUI", function()
    require("dapui").close()
end, {})

-- use <Alt-e> to eval expressions
vim.keymap.set({ 'n', 'v' }, '<M-e>', function() require('dapui').eval() end)

require('nvim-treesitter.configs').setup({
    highlight = {
        enable = true
    }
})


require("claude-code").setup({
  -- Terminal window settings
  window = {
    split_ratio = 0.3,      -- Percentage of screen for the terminal window (height for horizontal, width for vertical splits)
    position = "vertical",  -- Position of the window: "botright", "topleft", "vertical", "float", etc.
    enter_insert = true,    -- Whether to enter insert mode when opening Claude Code
    hide_numbers = true,    -- Hide line numbers in the terminal window
    hide_signcolumn = true, -- Hide the sign column in the terminal window
    
    -- Floating window configuration (only applies when position = "float")
    float = {
      width = "80%",        -- Width: number of columns or percentage string
      height = "80%",       -- Height: number of rows or percentage string
      row = "center",       -- Row position: number, "center", or percentage string
      col = "center",       -- Column position: number, "center", or percentage string
      relative = "editor",  -- Relative to: "editor" or "cursor"
      border = "rounded",   -- Border style: "none", "single", "double", "rounded", "solid", "shadow"
    },
  },
  -- File refresh settings
  refresh = {
    enable = true,           -- Enable file change detection
    updatetime = 100,        -- updatetime when Claude Code is active (milliseconds)
    timer_interval = 1000,   -- How often to check for file changes (milliseconds)
    show_notifications = true, -- Show notification when files are reloaded
  },
  -- Git project settings
  git = {
    use_git_root = true,     -- Set CWD to git root when opening Claude Code (if in git project)
  },
  -- Shell-specific settings
  shell = {
    separator = '&&',        -- Command separator used in shell commands
    pushd_cmd = 'pushd',     -- Command to push directory onto stack (e.g., 'pushd' for bash/zsh, 'enter' for nushell)
    popd_cmd = 'popd',       -- Command to pop directory from stack (e.g., 'popd' for bash/zsh, 'exit' for nushell)
  },
  -- Command settings
  command = "claude",        -- Command used to launch Claude Code
  -- Command variants
  command_variants = {
    -- Conversation management
    continue = "--continue", -- Resume the most recent conversation
    resume = "--resume",     -- Display an interactive conversation picker

    -- Output options
    verbose = "--verbose",   -- Enable verbose logging with full turn-by-turn output
  },
  -- Keymaps
  keymaps = {
    toggle = {
      normal = "<C-,>",       -- Normal mode keymap for toggling Claude Code, false to disable
      terminal = "<C-,>",     -- Terminal mode keymap for toggling Claude Code, false to disable
      variants = {
        continue = "<leader>cC", -- Normal mode keymap for Claude Code with continue flag
        verbose = "<leader>cV",  -- Normal mode keymap for Claude Code with verbose flag
      },
    },
    window_navigation = true, -- Enable window navigation keymaps (<C-h/j/k/l>)
    scrolling = true,         -- Enable scrolling keymaps (<C-f/b>) for page up/down
  }
})
