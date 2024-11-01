{mkPlugin, ...}: {
  extraPlugins = [
    (mkPlugin "auto-save")
  ];
  extraConfigLua = ''
    require("auto-save").setup()
  '';
}
