{mkPlugin, ...}: {
  extraPlugins = [
    (mkPlugin "quick-scope")
  ];
  extraConfigLua = ''
    vim.cmd([[
        highlight QuickScopePrimary guifg='#ff0000' gui=underline ctermfg=155 cterm=underline
        highlight QuickScopeSecondary guifg='#00ff00' gui=underline ctermfg=81 cterm=underline
    ]])
  '';
}
