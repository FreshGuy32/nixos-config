{ ... }:
{

  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    settings.user = {
      name = "FreshGuy32";
      email = "mathias.trapl@gmail.com";
    };
  };
}
