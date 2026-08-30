{ den, ... }: {
  den.aspects.apps.utility.switcheroo = {
    homeManager =
      { pkgs, ... }:
      {
        home.packages = with pkgs; [
          switcheroo
        ];
      };
  };
}
