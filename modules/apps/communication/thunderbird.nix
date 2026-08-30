{ den, ... }: {
  den.aspects.apps.communication.thunderbird = {
    homeManager =
      _:
      {
        programs.thunderbird = {
          enable = true;

          profiles = { };
        };
      };
  };
}
