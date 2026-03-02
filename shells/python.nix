{ pkgs, ... }:
pkgs.mkShell {
  name = "python";

  packages = with pkgs; [
    python3
    python3Packages.pip
    poetry # Poetry is a dependency management and packaging tool for Python.
  ];
}
