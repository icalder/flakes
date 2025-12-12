{ nixpkgs, system, ... }:
nixpkgs.legacyPackages.${system}.mkShell {
  name = "nodejs";

  packages = with nixpkgs.legacyPackages.${system}; [
    nodejs
  ];
}
