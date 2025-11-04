{ nixpkgs }:
nixpkgs.legacyPackages.x86_64-linux.mkShellNoCC rec {
  name = "buf";

  packages = with nixpkgs.legacyPackages.x86_64-linux; [
    protobuf # protoc required for Rust builds
    buf
  ];

  # shellHook = ''
  #   export PS1="''${PS1}\[\033[0;36m\]${name}$ \[\033[0m\]"
  # '';
}
