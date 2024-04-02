-- some utils
toggle_colourcolumn = function()
    if vim.o.colorcolumn == "80" then
        return "<cmd>set cc=<CR>"
    else
        return "<cmd>set cc=80<CR>"
    end
end

mode_format = function(str)
    if str == "V-LINE" then
        return "V-L"
    elseif str == "V-BLOCK" then
        return "V-B"
    elseif str == "COMMAND" then
        return "ƒ"
    else
        return str:sub(1, 1)
    end
end


-- vim options
vim.o.number = true
vim.o.mouse = "a"
vim.o.relativenumber = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.spell = false
vim.o.spelllang = "en_nz"
vim.o.completeopt = "menu,menuone,noselect"
vim.o.undofile = true
vim.o.undodir = vim.fn.stdpath("data") .. "/undo" -- persistent undo/redo
vim.o.undolevels = 1000
vim.o.undoreload = 10000
vim.o.title = true
vim.o.timeoutlen = 300
vim.go.laststatus = 3 -- 1 statusline for every window
vim.o.inccommand = "split"
vim.opt.list = true
vim.opt.smd = false

-- custom keymaps
vim.keymap.set({"n", "i"}, "<C-k>", "<cmd>move -2<cr>")
vim.keymap.set({"n", "i"}, "<C-j>", "<cmd>move +1<cr>")
vim.keymap.set("v", "<C-k>", "xkP`[V`]")
vim.keymap.set("v", "<C-j>", "xp`[V`]")

vim.keymap.set("n", "<C-h>", "xhP")
vim.keymap.set("n", "<C-l>", "xp")
vim.keymap.set("v", "<C-h>", "dhP`[1v")
vim.keymap.set("v", "<C-l>", "dp`[1v")

vim.keymap.set("v", "<C-c>", '"+y<cr>')
vim.keymap.set({"v", "n"}, "<C-a>", "ggVG")
vim.keymap.set("i", "<C-a>", "<esc>ggVG")

vim.keymap.set("n", "<leader>80", toggle_colourcolumn())


if vim.fn.has("termguicolors") == 1 then
    vim.o.termguicolors = true
end


vim.cmd([[
    colorscheme colorscheme
    filetype plugin on
]])


-- vimtex config
vim.g.tex_flavor = "latex"
vim.g.latex_view_general_viewer = "zathura"
vim.g.vimtex_view_method = "zathura"

tex_exe = "latexmk"
tex_opts = {
    "-xelatex",
    "-file-line-error",
    "-synctex=1",
    "-interaction=nonstopmode",
    "-pvc",
}

vim.g.vimtex_compiler_latexmk = {
    executable = tex_exe,
    options = tex_opts,
}


-- lazy loading
require("impatient")

vim.api.nvim_create_autocmd("BufWritePost", {
    group = vim.api.nvim_create_augroup("PACKER", { clear = true }),
    pattern = vim.fn.stdpath("config") .. "/init.lua",
    command = "source <afile> | PackerCompile",
})


-- telescope keybindings
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>ft', "<cmd>TodoTelescope<CR>", {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})


-- git-blame, disabled
vim.g.gitblame_enabled = 0


require("packer").startup(function(use)
    use("wbthomason/packer.nvim") -- Package manager

    use("lewis6991/impatient.nvim") -- Plugin cache

    -- NOTE: colour stuff ----------------------------------- (lush/shipwright)

    use("rktjmp/lush.nvim")
    use("rktjmp/shipwright.nvim")

    -- use({"~/exported-color/lush-template", config = function() vim.cmd[[colorscheme lush_template]] end})

    -- use({"./lua/colorscheme", config = function()
    -- vim.cmd[[colorscheme colorscheme]]
    -- end})
    
    -- NOTE: colour stuff ends ------------------------------


    -- git blame
    use('f-person/git-blame.nvim')

    -- comment plugin
    use({
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup({
                ignore = "^$",
                toggler = {
                    line = "gll",
                    block = "gbb",
                },
                opleader = {
                    line = "gl",
                    block = "gb",
                },
            })
        end,
    })

    -- TELESCOPE!!!
    use({
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        requires = { {'nvim-lua/plenary.nvim'} }
    })

    -- markdown preview
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

    -- emmet
    use('mattn/emmet-vim')

    -- colours for hex
    use {
        "norcalli/nvim-colorizer.lua",
        cmd = "ColorizerToggle",
        config = function()
            require("colorizer").setup()
        end,
    }

    -- latex
    use('lervag/vimtex')

    use({
        "danymat/neogen",
        config = function()
            require("neogen").setup({
                snippet_engine = "vsnip",
            })
        end,
        requires = "nvim-treesitter/nvim-treesitter",
    })

    -- formatting
    use({
        "mhartington/formatter.nvim",
        config = function()
            local util = require("formatter.util")

            require("formatter").setup({
                filetype = {

                    lua = {
                        require("formatter.filetypes.lua").stylua,

                        function()
                            if util.get_current_buffer_file_name() == "special.lua" then
                                return nil
                            end

                            return {
                                exe = "stylua",
                                args = {
                                    "--search-parent-directories",
                                    "--stdin-filepath",
                                    util.escape_path(util.get_current_buffer_file_path()),
                                    "--",
                                    "-",
                                },
                                stdin = true,
                            }
                        end,
                    },

                    --[[ ["*"] = {
                        require("formatter.filetypes.any").remove_trailing_whitespace,

                        function()
                            return {
                                exe = "prettier",
                                args = {
                                    "--stdin-filepath",
                                    util.escape_path(util.get_current_buffer_file_path()),
                                },
                                stdin = true,
                            }
                        end,
                    }, ]]

                    ["*"] = {
                        require("formatter.filetypes.any").remove_trailing_whitespace,
                    },
                },
            })
        end,
    })

    -- directory tree
    use({
        "kyazdani42/nvim-tree.lua",
        requires = "kyazdani42/nvim-web-devicons",
        wants = "nvim-web-devicons",
        config = function()
            require("nvim-web-devicons").setup()

            require("nvim-tree").setup({
                hijack_cursor = true,
                view = {
                    width = 40,
                },
            })
        end,
    })

    -- git integration
    use({
        "NeogitOrg/neogit",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            local neogit = require("neogit")
            neogit.setup({
                integrations = {
                    diffview = true,
                },
            })
        end,
    })

    -- indent
    use({
        "lukas-reineke/indent-blankline.nvim",
        opts = {
            show_trailing_blankline_indent = true,
            show_current_context = true,
            show_current_context_start = true
        }
    })

    -- treesitter!!
    use({
        "nvim-treesitter/nvim-treesitter",
        run = function()
            require("nvim-treesitter.install").update({ with_sync = true })
        end,
        config = function()
            require("nvim-treesitter.configs").setup({
                auto_install = true,
                highlight = {
                    enable = true,
                    disable = { "c", "tex", "latex" }, -- Use LSP
                },
                indent = {
                    enable = true,
                    disable = { "python" },
                },
            })
        end,
    })

    use({
        "nvim-treesitter/nvim-treesitter-context",
        config = function()
            require("treesitter-context").setup({})
        end,
    })

    use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })

    use({
        "folke/persistence.nvim",
        event = "BufReadPre", -- this will only start session saving when an actual file was opened
        module = "persistence",
        config = function()
            require("persistence").setup()
        end,
    })

    use({
        "edluffy/specs.nvim", -- Cursor animations
        config = function()
            require("specs").setup({
                show_jumps = true,
                min_jump = 10,
                popup = {
                    delay_ms = 0, -- delay before popup displays
                    inc_ms = 10, -- time increments used for fade/resize effects
                    blend = 10, -- starting blend, between 0-100 (fully transparent), see :h winblend
                    width = 10,
                    winhl = "PMenu",
                    fader = require("specs").exp_fader,
                    resizer = require("specs").shrink_resizer,
                },
                ignore_filetypes = {},
                ignore_buftypes = {
                    nofile = true,
                },
            })
        end,
    })

    use({
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            })
        end,
    })

    use({
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("todo-comments").setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            })
        end,
    })

    use({
        "petertriho/nvim-scrollbar",
        config = function()
            require("scrollbar").setup({})
        end,
    })

    use({
        "https://tpope.io/vim/sleuth.git", -- Automatically detect tab status
        config = function()
            vim.g.sleuth_neighbor_limit = 0
        end,
    })

    use({
        "goolord/alpha-nvim",
        requires = { "kyazdani42/nvim-web-devicons", "nvim-lua/plenary.nvim" },
        config = function()
            require("config.alpha")
        end,
    })


    use({
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup({})
        end,
    })

    -- Smart features - completion
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-path")
    use("f3fora/cmp-spell")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-cmdline")
    use("hrsh7th/cmp-vsnip")
    use("hrsh7th/vim-vsnip")
    use({
        "hrsh7th/nvim-cmp",
        config = function()
            local has_words_before = function()
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                return col ~= 0
                    and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
            end

            local feedkey = function(key, mode)
                vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
            end

            local cmp = require("cmp")
            cmp.setup({
                snippet = {
                    expand = function(args)
                        vim.fn["vsnip#anonymous"](args.body)
                    end,
                },
                window = {
                    completion = {
                        winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
                        col_offset = -3,
                        side_padding = 0,
                    },
                },
                formatting = {
                    fields = { "kind", "abbr", "menu" },
                    format = function(entry, vim_item)
                        local kind =
                        require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
                        local strings = vim.split(kind.kind, "%s", { trimempty = false })
                        kind.kind = " " .. strings[1] .. " "
                        kind.menu = "	(" .. strings[2] .. ")"

                        return kind
                    end,
                },
                mapping = {
                    ["<CR>"] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                    ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                        elseif vim.fn["vsnip#available"](1) == 1 then
                            feedkey("<Plug>(vsnip-expand-or-jump)", "")
                        elseif has_words_before() then
                            cmp.complete()
                        else
                            fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
                        end
                        end, { "i", "s" }),

                    ["<S-Tab>"] = cmp.mapping(function()
                    if cmp.visible() then
                        cmp.select_prev_item()
                        elseif vim.fn["vsnip#jumpable"](-1) == 1 then
                            feedkey("<Plug>(vsnip-jump-prev)", "")
                        end
                        end, { "i", "s" }),
                },
                window = {
                    -- completion = cmp.config.window.bordered(),
                    -- documentation = cmp.config.window.bordered(),
                },
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "vsnip" },
                    { name = "path" },
                    { name = "spell" },
                }),
            })

            cmp.setup.cmdline("/", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = "buffer" },
                },
            })

            cmp.setup.cmdline(":", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = "path" },
                    }, {
                        { name = "cmdline" },
                }),
            })

            local cmp_autopairs = require("nvim-autopairs.completion.cmp")
            local cmp = require("cmp")
            cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end,
    })

    -- Specific file support
    use("elkowar/yuck.vim")

    use("stevearc/dressing.nvim") -- Fancy UI

    -- Other LSP
    use("mrshmllow/document-color.nvim")
    use("onsails/lspkind.nvim")
    use("nvim-lua/lsp-status.nvim")
    use("smjonas/inc-rename.nvim")
    use("simrat39/symbols-outline.nvim")
    use("theHamsta/nvim-semantic-tokens")
    use("ray-x/lsp_signature.nvim")
    use({ "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons" })
    use({
        "kevinhwang91/nvim-ufo",
        requires = "kevinhwang91/promise-async",
    })
    use({
        "weilbith/nvim-code-action-menu",
        config = function()
            vim.g.code_action_menu_window_border = "rounded"
        end,
    })

    use({
        "neovim/nvim-lspconfig",
        config = function()
            -- Highlights
            vim.cmd([[
            hi! link VirtualTextError ErrorFloat
            hi! link VirtualTextWarning WarningFloat
            hi! link VirtualTextInfo InfoFloat
            hi! link VirtualTextHint HintFloat

            hi link LspStruct Structure
            hi link LspFunction Function
            hi link LspMacro Constant
            hi link LspKeyword Keyword
            hi link LspComment Comment
            hi link LspString String
            hi link LspNumber Number
            hi link LspOperator Operator
            hi link LspMethod Function

            hi link LspType Type
            hi link LspClass Type
            hi link LspOperator Operator
            ]])
            --[[
            " Namespace
            " Enum
            " Interface
            " TypeParameter
            " Paramater
            " Variable
            " Property
            " EnumMember
            " Event
            " Method
            " Regexp
            ]]
            --
            vim.o.foldcolumn = "1"
            vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
            vim.o.foldlevelstart = 99
            vim.o.foldenable = true
            -- vim.o.foldoptions = "nodigits"
            vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

            require("inc_rename").setup({
                input_buffer_type = "dressing",
            })
            require("document-color").setup({
                -- Default options
                mode = "background", -- "background" | "foreground" | "single"
            })
            require("symbols-outline").setup()
            require("trouble").setup()
            require("ufo").setup()
            require("nvim-semantic-tokens").setup({
                preset = "default",
            })
            local lsp_status = require("lsp-status")
            lsp_status.config({ status_symbol = "" })
            -- TODO more status: https://github.com/nvim-lua/lsp-status.nvim
            lsp_status.register_progress()

            local signs = {
                Error = " ",
                Warn = " ",
                Hint = " ",
                Info = " ",
            }

            local function format(diagnostic)
                local icon = ""
                if diagnostic.severity == vim.diagnostic.severity.WARN then
                    icon = ""
                end

                if diagnostic.severity == vim.diagnostic.severity.HINT then
                    icon = ""
                end

                if diagnostic.severity == vim.diagnostic.severity.INFO then
                    icon = ""
                end

                local message =
                string.format("%s  [%s][%s] %s", icon, diagnostic.code, diagnostic.source, diagnostic.message)
                return message
            end

            for type, icon in pairs(signs) do
                local sign = "DiagnosticSign" .. type
                local hl = "DiagnosticVirtualText" .. type
                vim.fn.sign_define(sign, { text = "", texthl = nil, numhl = hl })
            end

            vim.diagnostic.config({
                underline = true,
                signs = true,
                update_in_insert = true,
                severity_sort = true,
                float = {
                    border = "rounded",
                    focusable = false,
                    header = { "  Diagnostics:", "Normal" },
                    scope = "line",
                    source = false,
                    format = format,
                },
                virtual_text = {
                    prefix = "•",
                    spacing = 2,
                    source = false,
                    severity = {
                        min = vim.diagnostic.severity.HINT,
                    },
                    format = format,
                },
            })

            vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
                border = "rounded",
            })

            vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
                border = "rounded",
            })

            -- Use an on_attach function to only map the following keys
            -- after the language server attaches to the current buffer
            local on_attach = function(client, bufnr)
                --require'vim.lsp.buf'.semantic_tokens_full()
                --vim.cmd("autocmd BufEnter,CursorHold,InsertLeave <buffer> lua require 'vim.lsp.semantic_tokens'.refresh(vim.api.nvim_get_current_buf())")
                --
                if client.server_capabilities.colorProvider then
                    -- Attach document colour support
                    require("document-color").buf_attach(bufnr)
                end

                require("lsp_signature").on_attach({
                    bind = true, -- This is mandatory, otherwise border config won't get registered.
                    handler_opts = {
                        border = "rounded",
                    },
                }, bufnr)

                local function preview_location_callback(_, result)
                    if result == nil or vim.tbl_isempty(result) then
                    vim.lsp.buf.hover()
                        return nil
                    end
                    vim.lsp.util.preview_location(result[1], { border = "rounded" })
                end

                function Peek()
                    local params = vim.lsp.util.make_position_params()
                    return vim.lsp.buf_request(0, "textDocument/definition", params, preview_location_callback)
                end

                -- Mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                local bufopts = { noremap = true, silent = true, buffer = bufnr }
                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
                vim.keymap.set("n", "K", Peek, bufopts)
                vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
                -- vim.keymap.set("n", "<C-K>", vim.lsp.buf.signature_help, bufopts)
                vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
                --				vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
                vim.keymap.set("n", "<space>rn", ":IncRename ", bufopts)
                vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
                vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
                --vim.keymap.set('nv', '=', vim.lsp.buf.format, bufopts)
                vim.keymap.set("n", "<leader>ca", require("code_action_menu").open_code_action_menu, bufopts)

                vim.keymap.set("n", "<leader>do", "<cmd>lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })
            end

            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            capabilities.textDocument.foldingRange = {
                dynamicRegistration = false,
                lineFoldingOnly = true,
            }
            local lspconfig = require("lspconfig")
            for _, server in ipairs({
                "pylsp",
                "bashls",
                "html",
                "cssls",
                "jsonls",
                "tsserver",
                "eslint",
                "tailwindcss",
                }) do
                lspconfig[server].setup({ capabilities = capabilities, on_attach = on_attach })
            end
            lspconfig.texlab.setup({
                capabilities = vim.tbl_extend("keep", capabilities, lsp_status.capabilities),
                on_attach = on_attach,
                settings = {
                    texlab = {
                        build = {
                            args = { unpack(tex_opts), "%f" },
                            onSave = true,
                        },
                    },
                },
            })
            lspconfig.clangd.setup({
                capabilities = vim.tbl_extend("keep", capabilities, lsp_status.capabilities),
                cmd = { "clangd", "--function-arg-placeholders=false" },
                init_options = { clangdFileStatus = true },
                handlers = lsp_status.extensions.clangd.setup(),
                on_attach = function(c, b)
                    lsp_status.on_attach(c, b)
                    on_attach(c, b)
                end,
            })

            lspconfig.sourcekit.setup({
                capabilities = capabilities,
                on_attach = on_attach,
                filetypes = { "swift" }, -- Don't touch my C! >:(
            })

            lspconfig.emmet_ls.setup {
                capabilities = capabilities,
                on_attach = on_attach,
                cmd = {'emmet-language-server', '--stdio'},
                filetypes = {
                    'html', 'typescriptreact', 'javascriptreact', 'javascript',
                    'typescript', 'javascript.jsx', 'typescript.tsx', 'css', 'svelte'
                },
                -- root_dir = util.root_pattern("package.json", ".git"),
            }

            lspconfig.tsserver.setup {
                cmd = {"typescript-language-server", "--stdio"},
                filetypes = {
                    "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx"
                },
                init_options = {
                    hostInfo = "neovim"
                },
                root_dir = require("lspconfig.util").root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git")
            }

            lspconfig.svelte.setup {
                on_attach = on_attach,
                cmd = {'svelteserver', '--stdio'},
                filetypes = { 'svelte' },
                root_dir = require("lspconfig.util").root_pattern("package.json", ".git")
            }

            lspconfig.prismals.setup {
                on_attach = on_attach,
                filetypes = { 'prisma' },
                cmd = {'prisma-language-server', '--stdio'}
            }
        end,
    })

    -- lualine <:(
    use({
        "nvim-lualine/lualine.nvim",
        requires = {
            { "kyazdani42/nvim-web-devicons" },
        },
        config = function()
            require("lsp-status").config({
                show_filename = false,
                diagnostics = false,
            })
            local function lsp()
                return require("lsp-status").status()
            end

            local function realfile()
                return vim.o.buftype ~= "nofile" and vim.o.buftype ~= "help"
            end

            local fileformat_names = {
                dos = "CR-LF",
                unix = "LF",
                mac = "CR",
            }

            local function indentation()
                local isTabs = not vim.o.expandtab
                return (
                    isTabs
                    and ((vim.o.shiftwidth > 0 and vim.o.shiftwidth ~= vim.o.tabstop) and "Tabs/Spaces" or "Tabs")
                    or "Spaces"
                    )
                    .. ": "
                    .. tostring(vim.o.shiftwidth > 0 and vim.o.shiftwidth or vim.o.tabstop)
            end

            local function fmt_filefmt(str)
                return fileformat_names[str]
            end

            local function lsp_names()
                local client_names_on_buf = {}
                local clients = vim.lsp.get_active_clients()

                for _, client in ipairs(clients) do
                    if vim.lsp.buf_is_attached(0, client.id) then
                        table.insert(client_names_on_buf, client.name)
                    end
                end
                return table.concat(client_names_on_buf, ", ")
            end

            require("lualine").setup({
                options = {
                    icons_enabled = true,
                    theme = "blazer",
                    section_separators = { left = "", right = "" },
                    component_separators = { left = "", right = "" },
                    disabled_filetypes = { "coc-explorer" },
                    always_divide_middle = false,
                    global_status = true,
                },
                sections = {
                    lualine_a = { { "mode", fmt = mode_format } },
                    lualine_b = { 
                        "filename", 
                        "branch", 
                        { 
                            "diff",
                            diff_color = {
                                added = { fg = '#7AB87A' },
                                modified = { fg = '#B8B87A' },
                                removed = { fg = '#B87A7A' }
                            }
                        }
                    },
                    lualine_c = {
                        { 
                            "diagnostics",
                            sources = { "nvim_diagnostic" },
                            sections = { "error", "warn" },
                            diagnostics_color = { error = { fg = '#B87A7A' }, warn = { fg = '#B8B87A' } }
                        } 
                    },
                    -- lualine_x = {{'o:encoding', fmt = string.upper, cond = realfile}, {'o:fileformat', fmt = fmt_filefmt, cond = realfile}, {indentation, cond = realfile}, lsp_names},
                lualine_x = { {} },
                    lualine_y = { "filetype", lsp },
                    -- lualine_z = {{'progress', separator = { left = '' }}, { 'location', separator = { left = '', right = ''}}},
                lualine_z = { {} },
                },
                inactive_sections = {
                    lualine_a = { "filename" },
                    lualine_b = {},
                    lualine_c = {},
                    lualine_x = {},
                    lualine_y = {},
                    lualine_z = {},
                },
                tabline = {},
                extensions = {},
            })
        end,
    })
end)
