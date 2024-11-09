{inputs, ...}: {
  extraConfigLua = ''
    vim.keymap.set({ "i", "s" }, "<A-n>", function() require("luasnip").jump(1) end, { silent = true })
    vim.keymap.set({ "i", "s" }, "<A-p>", function() require("luasnip").jump(-1) end, { silent = true })
  '';
  plugins.luasnip = {
    enable = true;
    fromVscode = [
      {}
      {paths = "${inputs.friendly-snippets}";}
    ];
  };
  plugins.cmp_luasnip.enable = true;
}
