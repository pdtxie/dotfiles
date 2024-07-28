return {
	{ 
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true
	},
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-path" },
	{ "f3fora/cmp-spell" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-cmdline" },
	{ "hrsh7th/cmp-vsnip" },
	{ "hrsh7th/vim-vsnip" },
	{
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
	},

	{ "elkowar/yuck.vim" },

	{ "stevearc/dressing.nvim" },

	{ "mrshmllow/document-color.nvim" },
	{ "onsails/lspkind.nvim" },
	{ "nvim-lua/lsp-status.nvim" },
	{ "smjonas/inc-rename.nvim" },
	{ "simrat39/symbols-outline.nvim" },
	{ "theHamsta/nvim-semantic-tokens" },
	{ "ray-x/lsp_signature.nvim" },
	{ "folke/trouble.nvim", dependencies = "kyazdani42/nvim-web-devicons" },
	{
		"kevinhwang91/nvim-ufo",
		dependencies = "kevinhwang91/promise-async",
	},
	{
		"weilbith/nvim-code-action-menu",
		config = function()
			vim.g.code_action_menu_window_border = "rounded"
		end,
	},
	{
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

			-- require("symbols-outline").init()
			-- require("trouble").init()
			-- require("ufo").init()
			-- require("nvim-semantic-tokens").init({
			-- 	preset = "default",
			-- })
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
				-- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
				-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
				-- vim.keymap.set("n", "K", Peek, bufopts)
				-- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
				-- vim.keymap.set("n", "<C-K>", vim.lsp.buf.signature_help, bufopts)
				-- vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
				-- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
				-- vim.keymap.set("n", "<space>rn", ":IncRename ", bufopts)
				-- vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
				-- vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
				-- vim.keymap.set('nv', '=', vim.lsp.buf.format, bufopts)
				-- vim.keymap.set("n", "<leader>ca", require("code_action_menu").open_code_action_menu, bufopts)

				vim.keymap.set("n", "<leader>do", "<cmd>lua vim.diagnostic.open_float()<CR>", bufopts)
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
			-- lspconfig.texlab.setup({
			-- 	capabilities = vim.tbl_extend("keep", capabilities, lsp_status.capabilities),
			-- 	on_attach = on_attach,
			-- 	settings = {
			-- 		texlab = {
			-- 			build = {
			-- 				args = { unpack(tex_opts), "%f" },
			-- 				onSave = true,
			-- 			},
			-- 		},
			-- 	},
			-- })
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

			lspconfig.gopls.setup {
				filetypes = { "go", "gomod", "gowork", "gotmpl" },
				root_dir = require("lspconfig.util").root_pattern("go.work", "go.mod", ".git"),
				single_file_support = true,
				cmd = { "gopls" }
			}
		end,
	}
}
