{ nixpkgs }:
  nixpkgs.legacyPackages.x86_64-linux.mkShellNoCC {
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