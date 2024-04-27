local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
    return
end

-- 

return packer.startup(function(use)
    use("wbthomason/packer.nvim")

    use("nvim-lua/plenary.nvim")

    --use("bluz71/vim-nightfly-guicolors") -- preferred colorscheme
    --use("rockerBOO/boo-colorscheme-nvim")
    --use("windwp/wind-colors")
    use('keiyakeiya/PapilioDehaanii.vim')
    -- tmux & split window navigation
    use("christoomey/vim-tmux-navigator")

    use("szw/vim-maximizer") -- maximizes and restores current windows

    -- essential plugins
    use("tpope/vim-surround")
    use("vim-scripts/ReplaceWithRegister")

    -- commenting with gc
    use("numToStr/Comment.nvim")

    -- file explorer
    use("nvim-tree/nvim-tree.lua")

    --icons
    use("kyazdani42/nvim-web-devicons")

    --statusline
    use("nvim-lualine/lualine.nvim")

    -- fuzzy finding
    use({"nvim-telescope/telescope-fzf-native.nvim", run = "make"})
    use({"nvim-telescope/telescope.nvim", branch = "0.1.x"})

    -- autocompletion
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")

    -- snippets
    --use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")
    use("rafamadriz/friendly-snippets")

    -- lsp servers
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            {'williamboman/mason-lspconfig'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'}, -- required
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'hrsh7th/cmp-nvim-lsp'}, -- required
            {'L3MON4D3/LuaSnip'}, -- required
        }
    }

    ---- managing and installing lsp servers
    --use("williamboman/mason.nvim")
    --use("williamboman/mason-lspconfig.nvim")

    ---- configuring lsp servers
    --use("neovim/nvim-lspconfig")
    --use("hrsh7th/cmp-nvim-lsp")
    --use({ "glepnir/lspsaga.nvim", branch = "main" })
    --use("onsails/lspkind.nvim") -- adds VS code like icons to autocompletion

    if packer_bootstrap then
        require("packer").sync()
    end
end)
