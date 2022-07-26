{
  description = "<PROJECT-DESCRIPTION>"; ### TODO

  inputs = {
    nixpkgs.url   = "nixpkgs/nixos-22.05";
    flutter-flake = {
      url    = "github:FrankBeu/flutterFlake/3.0.5";
      # url  = "PATH/TO/LOCAL/FLUTTER-FLAKE" ;### DEVEL
      inputs.nixpkgs.follows  = "nixpkgs";
    };

  };

  outputs = { flutter-flake, nixpkgs, self }:
  let
    ### TODO other implement systems
    system = "x86_64-linux";
    pkgs   = import nixpkgs {
      inherit system;
    };
  in {
    devShell.${system} = pkgs.mkShell rec {
      inputsFrom = [ flutter-flake.devShell.${system} ];
    };
  };
}
