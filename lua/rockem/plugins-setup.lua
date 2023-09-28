-- auto install packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
  return
end

return packer.startup(function(use)
  use("wbthomason/packer.nvim")

  use("nvim-lua/plenary.nvim") -- lua functions that many plugins use

  -- Themes
  use("bluz71/vim-nightfly-guicolors")
  use "EdenEast/nightfox.nvim"

  -- Navigating inside and outside of Vim
  use("christoomey/vim-tmux-navigator")

  -- Maximize and restores current window
  use("szw/vim-maximizer")

  use("tpope/vim-surround")
  use("vim-scripts/ReplaceWithRegister")

  -- Comment with gc
  use("numToStr/Comment.nvim")

  -- file explorer
  use("nvim-tree/nvim-tree.lua")

  -- File icons
  use("kyazdani42/nvim-web-devicons")

  -- mode line
  use("nvim-lualine/lualine.nvim")

  -- fuzzy finding w/ telescope
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
  use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder 
  use("nvim-telescope/telescope-file-browser.nvim")

  -- auto completion
  use("hrsh7th/nvim-cmp") -- completion plugin
  use("hrsh7th/cmp-buffer") -- source for text in buffer
  use("hrsh7th/cmp-path") -- source for file system paths

  -- snippets
  use("L3MON4D3/LuaSnip") -- snippet engine
  use("saadparwaiz1/cmp_luasnip") -- for autocompletion
  use("rafamadriz/friendly-snippets") -- useful snippets

  -- Tree sitter
  use("nvim-treesitter/nvim-treesitter", {run = ":TSUpdate"})

  -- LSP
  -- managing & installing lsp servers
  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")

  -- configuring lsp servers
  use("neovim/nvim-lspconfig")

  -- Git
  use("lewis6991/gitsigns.nvim")
  use("tpope/vim-fugitive")
  -- use("kdheepak/lazygit.nvim")

  -- Clojure
  -- use 'Olical/conjure'
  -- use 'tpope/vim-dispatch'
  -- use 'radenling/vim-dispatch-neovim'
  -- use 'clojure-vim/vim-jack-in'

  if packer_bootstrap then 
    require("packer").sync()
  end
end)
