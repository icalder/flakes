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

  # Certain Rust tools won't work without this
  # This can also be fixed by using oxalica/rust-overlay and specifying the rust-src extension
  # See https://discourse.nixos.org/t/rust-src-not-found-and-other-misadventures-of-developing-rust-on-nixos/11570/3?u=samuela. for more details.
  RUST_SRC_PATH = "${nixpkgs.legacyPackages.x86_64-linux.rust.packages.stable.rustPlatform.rustLibSrc
  }";
}
