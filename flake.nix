{
  description = "Simple HTTP server written in Go";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: 
  let
    system = "x86_64-linux";
  in 
  {
    devShells."${system}".default = let
      pkgs = import nixpkgs {
        inherit system;
      };
    in pkgs.mkShell {
      packages = with pkgs; [
        go
        gcc
        neovim
      ];

      shellHook = ''
        echo `go version`
        echo `gcc --version`
        echo `nvim --version`
      '';
    };
  };
}
