{mkPlugin, ...}: {
  extraConfigLua = ''
    vim.keymap.set('n', '<leader>u', function() vim.cmd('UndotreeToggle') end)
  '';
  plugins.undotree.enable = true;
}
