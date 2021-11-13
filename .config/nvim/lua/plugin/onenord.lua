local colors = require("onenord.colors")

require("onenord").setup({
	borders = true, -- Split window borders
	italics = {
		comments = true, -- Italic comments
		strings = false, -- Italic strings
		keywords = true, -- Italic keywords
		functions = false, -- Italic functions
		variables = false, -- Italic variables
	},
	disable = {
		background = true, -- Disable setting the background color
		cursorline = false, -- Disable the cursorline
		eob_lines = true, -- Hide the end-of-buffer lines
	},
	custom_highlights = {
		NvimTreeNormal = { fg = colors.fg, bg = colors.active },
	}, -- Overwrite default highlight groups
})

vim.cmd([[colorscheme onenord]])
