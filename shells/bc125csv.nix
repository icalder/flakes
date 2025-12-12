{ nixpkgs, system, ... }:
let
  pkgs = nixpkgs.legacyPackages.${system};
  bc125csv = pkgs.python3Packages.buildPythonPackage {
    pname = "bc125csv";
    version = "unstable";

    src = pkgs.fetchFromGitHub {
      owner = "fdev";
      repo = "bc125csv";
      rev = "master";
      sha256 = "sha256-aigNTawMjR35v6DPaNKD04i04otWiCtYDDsk316qBDs=";
    };

    pyproject = true;
    build-system = with pkgs.python3Packages; [ setuptools ];
    propagatedBuildInputs = with pkgs.python3Packages; [
      pyudev
      pyserial
    ];
  };
in
pkgs.mkShell {
  name = "bc125csv";
  packages = [
    bc125csv
  ];
}
