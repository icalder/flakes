{
  description = "Various Nix flakes for development environments";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  };

  nixConfig = {
    bash-prompt-suffix = "\\[\\033[0;36m\\]\${name}$ \\[\\033[0m\\]";
  };

  outputs =
    inputs:
    let
      inherit (inputs) nixpkgs nixpkgs-unstable;
      system = "x86_64-linux";
      specialArgs = {
        inherit nixpkgs nixpkgs-unstable;
      };
    in
    {
      devShells.${system} =
        let
          imports = builtins.map (
            f:
            let
              s = builtins.split ".nix" f;
            in
            {
              name = builtins.elemAt s 0;
              value = import ./shells/${f};
            }
          ) (builtins.attrNames (builtins.readDir ./shells));
        in
        builtins.listToAttrs (
          builtins.map (s: {
            name = s.name;
            value = s.value specialArgs;
          }) imports
        );
    };
}
