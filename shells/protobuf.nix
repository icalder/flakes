{ nixpkgs, system, ... }:
nixpkgs.legacyPackages.${system}.mkShellNoCC rec {
  name = "proto";

  packages = with nixpkgs.legacyPackages.${system}; [
    protobuf # protoc required for Rust builds
    buf
    grpcurl
  ];

  # shellHook = ''
  #   export PS1="''${PS1}\[\033[0;36m\]${name}$ \[\033[0m\]"
  # '';
}
