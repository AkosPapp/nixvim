{mkPlugin, ...}: {
  extraPlugins = [
    (mkPlugin "friendly-snippets")
  ];
  extraConfigLua = ''
    -- will exclude all javascript snippets
    local ls = require("luasnip")

    vim.keymap.set({ "i", "s" }, "<A-j>", function() ls.jump(1) end, { silent = true })
    vim.keymap.set({ "i", "s" }, "<A-k>", function() ls.jump(-1) end, { silent = true })

    require("luasnip.loaders.from_vscode").load {}
  '';
  plugins.luasnip.enable = true;
}
