{
  description = "Various Nix flakes for development environments";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  };

  nixConfig = {
    bash-prompt-suffix = "\\[\\033[0;36m\\]\${name}$ \\[\\033[0m\\]";
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-unstable,
    }:
    {
      devShells = {
        x86_64-linux = {
          nats-server = import ./nats-server.nix {
            inherit nixpkgs;
          };

          protobuf = import ./protobuf.nix {
            inherit nixpkgs;
          };

          rust = import ./rust.nix {
            inherit nixpkgs;
          };

          nodejs = import ./nodejs.nix {
            inherit nixpkgs;
          };

          go = import ./go.nix {
            inherit nixpkgs;
            inherit nixpkgs-unstable;
          };
        };
      };
    };
}
