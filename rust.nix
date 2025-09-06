{ nixpkgs }:
nixpkgs.legacyPackages.x86_64-linux.mkShell {
  name = "rust";

  packages = with nixpkgs.legacyPackages.x86_64-linux; [
    cargo
    rustc
    rust-analyzer
    rustfmt
    clippy
  ];
}
