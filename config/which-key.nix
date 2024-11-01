{mkPlugin, ...}: {
  extraConfigLua = ''
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  '';
  plugins.which-key.enable = true;
}
