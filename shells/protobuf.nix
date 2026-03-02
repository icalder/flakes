{ pkgs, ... }:
pkgs.mkShellNoCC rec {
  name = "proto";

  packages = with pkgs; [
    protobuf # protoc required for Rust builds
    buf
    grpcurl
  ];

  # shellHook = ''
  #   export PS1="''${PS1}\[\033[0;36m\]${name}$ \[\033[0m\]"
  # '';
}
