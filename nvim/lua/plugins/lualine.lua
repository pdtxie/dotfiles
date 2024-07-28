
return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
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

			local function mode_format(str)
				if str == "V-LINE" then
					return "VL"
				elseif str == "V-BLOCK" then
					return "VB"
				elseif str == "COMMAND" then
					return "ƒ"
				else
					return str:sub(1, 1)
				end
			end

			require("lualine").setup({
				options = {
					icons_enabled = true,
					theme = "blazer",
					section_separators = { left = "", right = "" },
					component_separators = { left = "", right = "" },
					disabled_filetypes = { "coc-explorer" },
					always_divide_middle = false,
					globalstatus = true,
				},
				sections = {
					lualine_a = {
						{ "mode", fmt = mode_format }
					},
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
					lualine_x = { { "location" } },
					lualine_y = { { "filetype", lsp } },
					lualine_z = { },
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
	}
}
