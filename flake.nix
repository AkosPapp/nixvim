{
  description = "A nixvim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";
    flake-parts.url = "github:hercules-ci/flake-parts";
    treefmt-nix.url = "github:numtide/treefmt-nix";

    friendly-snippets = {
      url = "github:rafamadriz/friendly-snippets";
      flake = false;
    };
    lsp-zero = {
      url = "github:VonHeikemen/lsp-zero.nvim";
      flake = false;
    };
    quick-scope = {
      url = "github:unblevable/quick-scope";
      flake = false;
    };
    snipe = {
      url = "github:leath-dub/snipe.nvim";
      flake = false;
    };
  };
  outputs = {
    nixvim,
    flake-parts,
    ...
  } @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
      ];

      imports = [
        inputs.treefmt-nix.flakeModule
      ];

      perSystem = {system, ...}: let
        pkgs = import inputs.nixpkgs {
          system = system;
          config = {
            allowUnfree = true;
            allowBroken = true;
            permittedInsecurePackages = [
              "electron-27.3.11"
            ];
          };
        };
        nixvimLib = nixvim.lib.${system};
        nixvim' = nixvim.legacyPackages.${system};
        nixvimModule = {
          inherit pkgs;

          module = import ./config; # import the module directly
          # You can use `extraSpecialArgs` to pass additional arguments to your module files
          extraSpecialArgs =
            {
              # inherit (inputs) foo;
              inherit inputs;
              inherit pkgs;
              inherit system;
            }
            // import ./lib {inherit pkgs inputs;};
        };
        nvim = nixvim'.makeNixvimWithModule nixvimModule;
      in {
        checks = {
          # Run `nix flake check .` to verify that your config is not broken
          default = nixvimLib.check.mkTestDerivationFromNixvimModule nixvimModule;
        };

        treefmt = {
          programs.alejandra.enable = true;
          projectRoot = ./.;
          projectRootFile = "flake.nix";
        };

        packages = {
          default = nvim;
        };
      };
    };
}
