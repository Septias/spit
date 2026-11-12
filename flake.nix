{
  description = "Typst flake";
  inputs = {
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = inputs:
    with inputs;
      flake-utils.lib.eachDefaultSystem (
        system: let
          pkgs = nixpkgs-unstable.legacyPackages.${system};
        in {
          formatter = pkgs.alejandra;
          devShells.default = pkgs.mkShell {
            buildInputs = with pkgs; [
              typst
              typstyle
              tinymist
            ];
            # nixpkgs' google-fonts Libertinus Serif lacks small caps; use typst's embedded copy
            TYPST_IGNORE_SYSTEM_FONTS = "true";
            # einfachBdP from ./font, for both the typst CLI and tinymist
            shellHook = ''
              export TYPST_FONT_PATHS="$PWD/font"
            '';
          };
        }
      );
}
