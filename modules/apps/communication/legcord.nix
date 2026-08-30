{ den, ... }: {
  den.aspects.apps.communication.legcord = {
    homeManager =
      { pkgs, ... }:
      {
        home.packages = with pkgs; [
          legcord
        ];
      };
  };
}
