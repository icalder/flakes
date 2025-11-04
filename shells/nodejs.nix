{ nixpkgs }:
nixpkgs.legacyPackages.x86_64-linux.mkShell {
  name = "nodejs";

  packages = with nixpkgs.legacyPackages.x86_64-linux; [
    nodejs
  ];
}
