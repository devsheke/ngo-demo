{
  description = "devsheke's collection of development shells";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {inherit system;};
      nodePackages = pkgs.recurseIntoAttrs pkgs.nodePackages;
    in
      with pkgs; {
        devShell = mkShell {
          buildInputs = with pkgs;
            [
              nodejs_22
              pnpm
              prettierd
              tailwindcss-language-server
              vscode-langservers-extracted
            ]
            ++ (with nodePackages; [
              typescript-language-server
            ]);
        };
      });
}
