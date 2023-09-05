{
  inputs = {
    # use release 23.05 branch of the GitHub repository as input, this is the most common input format
    nixpkgs.url = "github:NixOS/nixpkgs/release-23.05";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = {
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem
    (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [alejandra deadnix stylua luaPackages.luacheck];
          shellHook = ''
            git config --local core.hooksPath .hooks
          '';
        };
      }
    );
}
