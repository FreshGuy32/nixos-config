{ den, ... }: {
  den.aspects.apps.utility.bash = {
    homeManager =
      _:
      {
        programs.bash = {
          enable = true;
          enableCompletion = true;
        };
        programs.starship = {
          enable = true;
          # custom settings
          settings = {
            add_newline = false;
            aws.disabled = true;
            gcloud.disabled = true;
            line_break.disabled = true;
          };
        };
      };
  };
}
