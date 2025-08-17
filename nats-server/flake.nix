{
  description = "NATS Server with Jetstream support";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.05";
  };

  outputs = { self, nixpkgs }: {
    devShells.x86_64-linux.default = nixpkgs.legacyPackages.x86_64-linux.mkShellNoCC {
      packages = with nixpkgs.legacyPackages.x86_64-linux; [
        nats-server
      ];

      # --config ${./nats-server.conf}
      shellHook = ''
        nats-server --js
      '';

      # GREETING = "Hello, Nix!";
    };
  };
}
