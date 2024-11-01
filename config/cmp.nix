{mkPlugin, ...}: {
  plugins.cmp = {
    enable = true;
    autoEnableSources = true;
    settings = {
      #window = {
      #  completion = {__raw = "cmp.config.window.bordered()";};
      #  documentation = {__raw = "cmp.config.window.bordered()";};
      #};
      mapping = {
        "<C-b>" = "cmp.mapping.scroll_docs(-4)";
        "<C-f>" = "cmp.mapping.scroll_docs(4)";
        "<C-Space>" = "cmp.mapping.complete()";
        "<A-Space>" = "cmp.mapping.complete()";
        "<C-e>" = "cmp.mapping.abort()";
      };
      snippet.expand = ''
        function(args)
          require('luasnip').lsp_expand(args.body)
        end
      '';
      sources = [
        {name = "luasnip";}
        {name = "path";}
        {name = "nvim_lsp";}
        {name = "treesitter";}
        {name = "buffer";}
      ];
    };
    cmdline = {
      ":" = {
        mapping = {
          __raw = "cmp.mapping.preset.cmdline()";
        };
        matching = {disallow_symbol_nonprefix_matching = false;};
        sources = [
          {
            name = "path";
          }
          {
            name = "cmdline";
            option = {
              ignore_cmds = [
                "Man"
                "!"
              ];
            };
          }
        ];
      };
      "/" = {
        mapping = {
          __raw = "cmp.mapping.preset.cmdline()";
        };
        sources = [
          {
            name = "buffer";
          }
        ];
      };
      "?" = {
        mapping = {
          __raw = "cmp.mapping.preset.cmdline()";
        };
        sources = [
          {
            name = "buffer";
          }
        ];
      };
    };
  };
}
