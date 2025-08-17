let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-25.05";
  pkgs = import nixpkgs {
    config = { };
    overlays = [ ];
  };
in

pkgs.mkShellNoCC {
  packages = with pkgs; [
    nats-server
  ];

  # --config ${./nats-server.conf}
  shellHook = ''
    nats-server --js
  '';

  # GREETING = "Hello, Nix!";
}
