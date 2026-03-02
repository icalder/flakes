{ pkgs-unstable, ... }:
pkgs-unstable.mkShell {
  name = "deno";

  packages = with pkgs-unstable; [
    deno
  ];
}
