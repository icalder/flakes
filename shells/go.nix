{ nixpkgs, nixpkgs-unstable }:
nixpkgs.legacyPackages.x86_64-linux.mkShell {
  name = "go";

  packages = with nixpkgs-unstable.legacyPackages.x86_64-linux; [
    go
  ];
}
