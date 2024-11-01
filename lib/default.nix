{
  pkgs,
  inputs,
  ...
}: {
  mkKey = rec {
    mkKeymap = mode: key: action: desc: {
      inherit mode key action;
      options = {
        inherit desc;
        silent = true;
        noremap = true;
        remap = true;
      };
    };
    # Make keymap without description:
    mkKeymap' = mode: key: action: mkKeymap mode key action null;
    mkKeymapWithOpts = mode: key: action: desc: opts:
      (mkKeymap mode key action desc)
      // {
        options = opts;
      };
  };

  mkPkgs = name: src: pkgs.vimUtils.buildVimPlugin {inherit name src;};

  mkPlugin = name:
    pkgs.vimUtils.buildVimPlugin {
      inherit name;
      src = inputs.${name};
    };
}
