{
  description = "Various Nix flakes for development environments";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.05";
  };

  nixConfig = {
    bash-prompt-suffix = "\${name}$ ";
  };

  outputs = { self, nixpkgs }: {
    # NATS Server
    devShells.x86_64-linux.nats-server = nixpkgs.legacyPackages.x86_64-linux.mkShellNoCC {
    name = "nats-server";

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
