{
  mkPlugin,
  pkgs,
  ...
}: {
  plugins.treesitter = {
    enable = true;

    #grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
    #        angular
    #        bash
    #        c
    #        c_sharp
    #        cpp
    #        css
    #        dockerfile
    #        go
    #        html
    #        java
    #        javascript
    #        json
    #        jsonc
    #        lua
    #        markdown
    #        markdown_inline
    #        python
    #        query
    #        regex
    #        rust
    #        scss
    #        toml
    #        typescript
    #        vim
    #        vimdoc
    #        yaml
    #];
  };
}
