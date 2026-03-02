{ pkgs, ... }:
pkgs.mkShell {
  name = "nodejs";

  packages = with pkgs; [
    nodejs
  ];
}
