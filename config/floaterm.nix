{mkPlugin, ...}: {
  plugins.floaterm = {
    enable = true;
    settings = {
      width = 0.9;
      height = 0.9;
    };
  };
  extraConfigLua = ''
    vim.keymap.set({ 'n', 'i', 's', 'v', 't' }, "<A-t>", function() vim.api.nvim_command('FloatermToggle') end)
    vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = false, silent = true })
    vim.api.nvim_set_keymap('t', '<C-Space>', '<C-\\><C-n><leader>', { noremap = true, silent = true })
  '';
}
