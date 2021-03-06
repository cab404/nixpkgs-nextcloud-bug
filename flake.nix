{
  description = "A very basic flake";

  inputs = {
    nixops.url = "github:nixos/nixops/master";
    nixpkgs.url = "github:nixos/nixpkgs/master";
    home-manager.url = "github:nix-community/home-manager";

    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixops.inputs.nixpkgs.follows = "nixpkgs";

  };

  outputs = { self, nixpkgs, nixops, home-manager, ... }:
    let
      sys = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages."${sys}";
    in
      {
        devShell.x86_64-linux = pkgs.mkShell {
          buildInputs = [
            nixops.defaultPackage."${sys}"
            pkgs.nixfmt
          ];
        };

      };
}
