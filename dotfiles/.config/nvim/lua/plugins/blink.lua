return {
	"saghen/blink.cmp",

	version = "1.*",

	config = function()
		local blink = require("blink.cmp")

		blink.setup({
			snippets = {
				preset = "luasnip",
			},

			keymap = {
				preset = "default",
			},

			appearance = {
				nerd_font_variant = "mono",
			},

			sources = {
				default = {
					"lazydev",
					"lsp",
					"path",
					"snippets",
					"buffer",
				},
				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						score_offset = 100,
					},
				},
			},

			completion = {
				menu = {
					border = "rounded",
					draw = {
						treesitter = { "lsp" },
						columns = {
							{ "kind_icon" },
							{ "label", "label_description", gap = 1 },
							{ "kind" },
							{ "source_name" },
						},
					},
				},
				documentation = {
					window = {
						border = "rounded",
					},
					auto_show = true,
					auto_show_delay_ms = 200,
				},
			},

			signature = {
				window = {
					border = "rounded",
				},
			},

			cmdline = {
				completion = {
					menu = { auto_show = true },
				},
			},

			fuzzy = { implementation = "prefer_rust_with_warning" },
		})
	end,
}
