{
  description = "Blog";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        blog = pkgs.stdenv.mkDerivation {
          name = "blog";
          src = self;

          buildInputs = with pkgs; [ asciidoctor hugo ];

          buildPhase = "${pkgs.hugo}/bin/hugo";
        };
      in { packages.default = blog; });
}
