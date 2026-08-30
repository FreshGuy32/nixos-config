{ den, ... }: {
  den.aspects.apps.gaming.steam = {
    includes = [
      (den.batteries.unfree [
        "steam"
        "steam-unwrapped"
      ])
    ];

    nixos =
      { pkgs, ... }:
      {
        programs.steam = {
          enable = true;
          extraCompatPackages = [ pkgs.proton-ge-bin ];
        };
        programs.gamemode.enable = true;
        hardware.steam-hardware.enable = true;

        environment.systemPackages = [ pkgs.game-devices-udev-rules ];
      };

    provides.to-users.home-persist.directories = [
      ".steam"
      ".local/share/Steam"
    ];
  };
}
