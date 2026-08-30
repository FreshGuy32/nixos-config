{ den, ... }: {
  den.aspects.apps.dev.virtualization = {
    homeManager =
      { pkgs, ... }:
      {
        home.packages = with pkgs; [
          gnome-boxes
        ];
      };
  };
}
