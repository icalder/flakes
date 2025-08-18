{
  description = "Various Nix flakes for development environments";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
  };

  nixConfig = {
    bash-prompt-suffix = "\\[\\033[0;36m\\]\${name}$ \\[\\033[0m\\]";
  };

  outputs = { self, nixpkgs }: {
    # NATS Server
    devShells.x86_64-linux.nats-server = import ./nats-server.nix {
      inherit nixpkgs;
    };
  };
}
