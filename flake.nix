{
  description = "Default community health files for `github:sellout` repos";

  nixConfig = {
    ## https://github.com/NixOS/rfcs/blob/master/rfcs/0045-deprecate-url-syntax.md
    extra-experimental-features = ["no-url-literals"];
    extra-trusted-public-keys = [
      "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
    ];
    extra-trusted-substituters = ["https://cache.garnix.io"];
    ## Isolate the build.
    registries = false;
    sandbox = true;
  };

  outputs = inputs: let
    pname = ".github";
  in
    inputs.flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import inputs.nixpkgs {inherit system;};

      src = pkgs.lib.cleanSource ./.;

      format = inputs.flaky.lib.format pkgs {};
    in {
      devShells.default =
        inputs.flaky.lib.devShells.default pkgs inputs.self [] "";

      checks.format = format.check inputs.self;

      formatter = format.wrapper;
    });

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    flaky.url = "github:sellout/flaky";
    nixpkgs.url = "github:NixOS/nixpkgs/release-23.05";
  };
}
