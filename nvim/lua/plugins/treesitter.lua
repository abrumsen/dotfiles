return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local config = require("nvim-treesitter.configs")
			config.setup({
				ensure_installed = { "lua", "python", "html", "css", "javascript", "c" },
				sync_install = false,
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
				modules = {},
				ignore_install = {},
			})
		end,
	},
}
