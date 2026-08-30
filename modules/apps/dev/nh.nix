{ den, ... }: {
  den.aspects.apps.dev.nh = {
    homeManager =
      _:
      {
        programs.nh = {
          enable = true;
          flake = "/home/mathias/nixos-config";
        };
      };
  };
}
