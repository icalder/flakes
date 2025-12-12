{ nixpkgs, system, ... }:
nixpkgs.legacyPackages.${system}.mkShell {
  name = "python";

  packages = with nixpkgs.legacyPackages.${system}; [
    python3
    python3Packages.pip
    poetry # Poetry is a dependency management and packaging tool for Python.
  ];
}
