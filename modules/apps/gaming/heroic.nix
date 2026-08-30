{ den, ... }: {
  den.aspects.apps.gaming.heroic = {
    homeManager =
      { pkgs, ... }:
      {
        home.packages = with pkgs; [
          heroic
        ];
      };
  };
}
