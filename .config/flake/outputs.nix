{
  flake-utils,
  flaky,
  nixpkgs,
  self,
  systems,
}: let
  supportedSystems = import systems;
in
  {
    schemas = {
      inherit
        (flaky.schemas)
        projectConfigurations
        devShells
        checks
        formatter
        ;
    };
  }
  // flake-utils.lib.eachSystem supportedSystems (system: let
    pkgs = nixpkgs.legacyPackages.${system}.appendOverlays [
      flaky.overlays.default
    ];
  in {
    projectConfigurations =
      flaky.lib.projectConfigurations.default {inherit pkgs self;};

    devShells =
      self.projectConfigurations.${system}.devShells
      // {default = flaky.lib.devShells.default system self [] "";};
    checks = self.projectConfigurations.${system}.checks;
    formatter = self.projectConfigurations.${system}.formatter;
  })
