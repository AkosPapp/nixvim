{mkPlugin, ...}: {
  extraConfigLua = ''
    -- disable netrw at the very start of your init.lua
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- set termguicolors to enable highlight groups
    vim.opt.termguicolors = true

    -- keybinds
    vim.keymap.set("n", "<leader>nt", function() vim.cmd("NvimTreeToggle") end)
    vim.keymap.set("n", "<leader>nr", function() vim.cmd("NvimTreeRefresh") end)
    vim.keymap.set("n", "<leader>nf", function() vim.cmd("NvimTreeFindFile") end)
  '';

  plugins.nvim-tree = {
    enable = true;
    view = {
      width = 30;
    };
    renderer = {
      groupEmpty = true;
    };
    filters = {
      dotfiles = false;
    };
  };
}
