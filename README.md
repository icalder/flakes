# Dev environment flakes

## Example usage

```bash
nix develop ~/flakes#protobuf
nix develop github:icalder/flakes/#nats-server
```

## Direnv .envrc

```bash
use flake ~/flakes#protobuf
```

## Combining devShells

As well as a directory hierarchy, you can use a custom flake with `use flake` in .envrc.

```nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    flakes.url = "github:icalder/flakes";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      flakes,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.mkShellNoCC {
          inputsFrom = [
            flakes.devShells.${system}.go
            flakes.devShells.${system}.protobuf
          ];
          # You can also add project-specific tools here
          # buildInputs = [ pkgs.git ];
        };
      }
    );
}
```
