{ den, ... }: {
  den.aspects.apps.communication.signal = {
    homeManager =
      { pkgs, ... }:
      {
        home.packages = with pkgs; [
          signal-desktop
        ];
      };
  };
}
