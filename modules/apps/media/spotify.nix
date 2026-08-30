{ den, ... }: {
  den.aspects.apps.media.spotify = {
    includes = [
      (den.batteries.unfree [
        "spotify"
      ])
    ];

    homeManager =
      { pkgs, ... }:
      {
        home.packages = with pkgs; [
          spotify
        ];
      };
  };
}
