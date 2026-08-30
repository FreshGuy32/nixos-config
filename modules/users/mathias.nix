{ den, ... }:
{
  # user aspect
  den.aspects.mathias = {
    includes = [
      den.batteries.define-user
      den.batteries.primary-user
      (den.batteries.user-shell "fish")

      den.aspects.apps.dev.git
      den.aspects.apps.dev.nh
      den.aspects.apps.dev.nixos
      den.aspects.apps.dev.virtualization
      den.aspects.apps.dev.vscodium

      den.aspects.apps.browser

      den.aspects.apps.communication.legcord
      den.aspects.apps.communication.signal
      den.aspects.apps.communication.thunderbird

      den.aspects.apps.media.spotify

      den.aspects.apps.gaming.heroic
      den.aspects.apps.gaming.steam

      den.aspects.apps.utility.bash
      den.aspects.apps.utility.solaar
      den.aspects.apps.utility.switcheroo
    ];

    homeManager =
      { pkgs, ... }:
      {
        home.packages = [ pkgs.htop ];
      };

    # user can provide NixOS configurations
    # to any host it is included on
    provides.to-hosts.nixos = { pkgs, ... }: { };
  };
}
