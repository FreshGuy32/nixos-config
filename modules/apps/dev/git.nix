{ den, ... }: {
  den.aspects.apps.dev.git = {
    homeManager =
      _:
      {
        programs.git = {
          enable = true;
          settings.user = {
            name = "FreshGuy32";
            email = "mathias.trapl@gmail.com";
          };
        };
      };
  };
}
