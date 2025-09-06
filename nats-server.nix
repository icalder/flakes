{ nixpkgs }:
  nixpkgs.legacyPackages.x86_64-linux.mkShellNoCC {
    # See example jere for a Nix shell with a PostgreSQL server.
    # It demonstrates a way to create a config file for the server and use a data dir:
    # https://github.com/RKlompUU/nix-recipes/blob/main/pg-server/shell.nix

    # Using direnv: https://nixos.wiki/wiki/Development_environment_with_nix-shell

    name = "nats-server";

    packages = with nixpkgs.legacyPackages.x86_64-linux; [
      nats-server
    ];

    # --config ${./nats-server.conf}
    shellHook = ''
      nats-server --js
    '';

    # GREETING = "Hello, Nix!";
  }