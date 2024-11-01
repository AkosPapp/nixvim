{lib, ...}: {
  imports = with builtins;
    map (fn: ./${fn})
    (filter (fn: fn != "default.nix" && lib.strings.hasInfix ".nix" fn) (attrNames (readDir ./.)));
  performance = {
    byteCompileLua = {
      enable = true;
      configs = true;
    };
    combinePlugins.enable = true;
  };
}
