{ nixpkgs, nixpkgs-unstable, system, ... }:
nixpkgs.legacyPackages.${system}.mkShell {
  name = "go";

  packages = with nixpkgs-unstable.legacyPackages.${system}; [
    go
  ];
}
