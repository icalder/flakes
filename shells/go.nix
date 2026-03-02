{ pkgs, pkgs-unstable, ... }:
pkgs.mkShell {
  name = "go";

  packages = with pkgs-unstable; [
    go
  ];
}
