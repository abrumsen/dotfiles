return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"nvimtools/none-ls.nvim",
		},
		config = function()
			require("mason-null-ls").setup({
				ensure_installed = {
					"black",
					"stylua",
					"prettier",
					"google_java_format",
				},
				automatic_installation = true,
			})

			local null_ls = require("null-ls")

			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.prettier.with({
						filetypes = { "markdown", "css", "toml", "json" },
					}),
					null_ls.builtins.formatting.black,
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.google_java_format,
				},
			})

			-- Format function that specifically uses null-ls
			local format = function()
				vim.lsp.buf.format({
					timeout_ms = 5000,
					filter = function(client)
						return client.name == "null-ls"
					end,
				})
			end

			-- Format-on-save (can be toggled)
			vim.g.format_on_save = true
			vim.api.nvim_create_autocmd("BufWritePre", {
				callback = function()
					if vim.g.format_on_save then
						format()
					end
				end,
			})

			-- Keybindings
			vim.keymap.set("n", "<leader>cf", format, { desc = "Format buffer" })
			vim.keymap.set("n", "<leader>ctf", function()
				vim.g.format_on_save = not vim.g.format_on_save
				local status = vim.g.format_on_save and "enabled" or "disabled"
				vim.notify("Format on save " .. status)
			end, { desc = "Toggle format on save" })
		end,
	},
}
