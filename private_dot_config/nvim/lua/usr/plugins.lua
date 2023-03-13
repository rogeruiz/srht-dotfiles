-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return require("packer").startup(function()
	-- Packer can manage itself
	use("wbthomason/packer.nvim")
	-- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/popup.nvim")
	-- Editorconfig integration written in Lua
	use("gpanders/editorconfig.nvim")

	-- Useful Lua utilities
	use("nvim-lua/plenary.nvim")
	--
	-- LSP
	use({
		"williamboman/mason.nvim", -- simple to use language server installer
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		"jose-elias-alvarez/null-ls.nvim", -- for formatters and linters
	})

	use("b0o/schemastore.nvim")

	use("simrat39/rust-tools.nvim")

	use({
		"danymat/neogen",
		requires = "nvim-treesitter/nvim-treesitter",
		-- Uncomment next line if you want to follow only stable versions
		-- tag = "*"
	})

	use({
		"numToStr/Comment.nvim",
		requires = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
	})

	use({ "catppuccin/nvim", as = "catppuccin" })

	use("andymass/vim-matchup")

	use("jxnblk/vim-mdx-js")

	use("kyazdani42/nvim-web-devicons")

	use("rhysd/conflict-marker.vim")

	use({
		"nvim-lualine/lualine.nvim",
		requires = {
			"SmiteshP/nvim-navic",
			"nvim-treesitter/nvim-treesitter",
		},
	})
	use({
		"akinsho/bufferline.nvim",
		requires = "kyazdani42/nvim-web-devicons",
	})
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		requires = {
			"HiPhish/nvim-ts-rainbow2",
			"nvim-treesitter/nvim-treesitter-refactor",
		},
	})

	use("RRethy/vim-illuminate")

	use({
		"goolord/alpha-nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
		config = function() end,
	})

	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icon
		},
	})

	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
	})

	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})

	use({
		"ray-x/go.nvim",
		requires = {
			"mfussenegger/nvim-dap",
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
			"ray-x/guihua.lua",
		},
	})

	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-emoji",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-cmdline",
			"dcampos/nvim-snippy",
			"dcampos/cmp-snippy",
			"f3fora/cmp-spell",
		},
	})

	use("windwp/nvim-autopairs")

	use("lukas-reineke/indent-blankline.nvim")

	use({
		"kristijanhusak/vim-dadbod-ui",
		requires = {
			"tpope/vim-dadbod",
		},
	})

	use("f-person/git-blame.nvim")
	use("lewis6991/gitsigns.nvim")

	use("norcalli/nvim-colorizer.lua")

	use("liuchengxu/vista.vim")

	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
	})

	-- Markdown preview
	use({
		"iamcco/markdown-preview.nvim",
		ft = "markdown",
		run = "cd app && yarn install",
	})

	use({
		"nvim-neorg/neorg",
		requires = "nvim-lua/plenary.nvim",
	})

	use({
		"cuducos/yaml.nvim",
		requires = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-telescope/telescope.nvim", -- optional
		},
	})
	use({
		"folke/twilight.nvim",
		config = function()
			require("twilight").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})

	use("sitiom/nvim-numbertoggle")

	use({
		"luizribeiro/vim-cooklang",
		ft = {
			"cook",
		},
	})

	use("j-hui/fidget.nvim")
end)
