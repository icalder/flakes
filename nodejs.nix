{ nixpkgs }:
nixpkgs.legacyPackages.x86_64-linux.mkShell {
  name = "noidejs";

  packages = with nixpkgs.legacyPackages.x86_64-linux; [
    nodejs
  ];
}
