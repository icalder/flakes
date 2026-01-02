{ nixpkgs-unstable, system, ... }:
nixpkgs-unstable.legacyPackages.${system}.mkShell {
  name = "deno";

  packages = with nixpkgs-unstable.legacyPackages.${system}; [
    deno
  ];
}
