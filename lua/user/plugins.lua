local fn = vim.fn
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git", "clone", "--depth", "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)



--	--= PLUGINS HERE =--

	use "wbthomason/packer.nvim"            -- Have packer manage itself
  use "lunarvim/darkplus.nvim"            -- Colorscheme
  use "neovim/nvim-lspconfig"             -- Enable LSP
  use "williamboman/nvim-lsp-installer"   -- Auto-install LSP servers
  use "hrsh7th/cmp-nvim-lsp"              -- LSP Completion
  use "hrsh7th/cmp-buffer"                -- Buffer Completion
  use "hrsh7th/cmp-path"                  -- Path Completion
  use "hrsh7th/cmp-cmdline"               -- Command-line Completion
  use "hrsh7th/nvim-cmp"                  -- Completion Plugin
  use "L3MON4D3/LuaSnip"                  -- Snippet Engine

--	--= PlUGINS END =--



  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
