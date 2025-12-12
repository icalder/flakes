{ nixpkgs, ... }:
nixpkgs.legacyPackages.x86_64-linux.mkShell {
  name = "python";

  packages = with nixpkgs.legacyPackages.x86_64-linux; [
    python3
    python3Packages.pip
    poetry # Poetry is a dependency management and packaging tool for Python.
  ];
}
