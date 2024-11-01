{mkPlugin, ...}: {
  extraPlugins = [
    (mkPlugin "snipe")
  ];
  extraConfigLua = ''
    local snipe = require('snipe')
    snipe.setup()
    vim.keymap.set('n', 'gb', function() snipe.open_buffer_menu() end)
  '';
}
