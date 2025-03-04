{
  mkPlugin,
  pkgs,
  ...
}: {
  extraConfigLua = ''
    vim.keymap.set('n', '<leader>lf', function() vim.lsp.buf.format() end)
    vim.keymap.set('n', '<leader>ld', function() vim.lsp.buf.definition() end)
    vim.keymap.set('n', '<leader>lh', function() vim.lsp.buf.hover() end)
    vim.keymap.set('n', '<leader>lr', function() vim.lsp.buf.references() end)
    vim.keymap.set('n', '<leader>ls', function() vim.lsp.buf.document_symbol() end)
    vim.keymap.set('n', '<leader>lw', function() vim.lsp.buf.workspace_symbol() end)
    vim.keymap.set('n', '<leader>lD', function() vim.lsp.buf.type_definition() end)
    vim.keymap.set('n', '<leader>li', function() vim.lsp.buf.implementation() end)
    vim.keymap.set('n', '<leader>lR', function() vim.lsp.buf.rename() end)
    vim.keymap.set('n', '<leader>lca', function() vim.lsp.buf.code_action() end)
    vim.keymap.set('n', '<leader><leader>', function() vim.lsp.buf.code_action() end)
    vim.keymap.set('n', '<leader>lwa', function() vim.lsp.buf.add_workspace_folder() end)
    vim.keymap.set('n', '<leader>lwr', function() vim.lsp.buf.remove_workspace_folder() end)
    vim.keymap.set('n', '<leader>lwl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end)
    vim.keymap.set('n', '<leader>lq', function() vim.diagnostic.set_loclist() end)
    vim.keymap.set('n', '<leader>ln', function() vim.diagnostic.goto_next() end)
    vim.keymap.set('n', '<leader>lp', function() vim.diagnostic.goto_prev() end)
    vim.keymap.set('n', '<leader>lS', function() vim.diagnostic.show_line_diagnostics() end)
    vim.keymap.set('n', '<leader>l=', function() vim.diagnostic.set_signs() end)
    vim.keymap.set('n', '<leader>l0', function() vim.diagnostic.set_loclist() end)
  '';

  plugins.lsp = {
    enable = true;
    servers = {
      clangd.enable = true;
      cmake.enable = true;
      lua_ls.enable = true;
      rust_analyzer = {
        enable = true;
        installCargo = true;
        installRustc = true;
      };
      jedi_language_server.enable = true;
      dprint.enable = true;
      nixd.enable = true;
      marksman.enable = true;
      omnisharp = {
        enable = true;
        settings = {
          enableEditorConfigSupport = true;
          enableImportCompletion = true;
          enableMsBuildLoadProjectsOnDemand = false;
          enableRoslynAnalyzers = true;
          analyzeOpenDocumentsOnly = false;
          organizeImportsOnFormat = true;
          sdkIncludePrereleases = false;
        };
      };
    };
  };
}
