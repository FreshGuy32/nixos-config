{ den, ... }: {
  den.aspects.apps.browser = {
    includes = [
      (den.batteries.unfree [
        "google-chrome"
      ])
    ];
    homeManager =
      { pkgs, ... }:
      {
        home.packages = with pkgs; [
          google-chrome
        ];
      };
  };
}
