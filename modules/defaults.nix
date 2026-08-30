{ lib, den, ... }:
{
  den.default = {
    includes = [
      den.batteries.hostname

      den.aspects.core.nix
      den.aspects.core.security

      den.aspects.desktop.fonts
    ];

    nixos = {
      system.stateVersion = "26.05";
      home-manager.useUserPackages = true;
      home-manager.useGlobalPkgs = true;
    };

    homeManager.home.stateVersion = "26.05";
  };

  # enable hm by default
  den.schema.user.classes = lib.mkDefault [ "homeManager" ];
}
