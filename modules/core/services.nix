{ den, ... }: {
  den.aspects.core.services.nixos = _: {
    services.fstrim.enable = true;

    services.displayManager.gdm.enable = true;
    services.desktopManager.gnome.enable = true;

    services.xserver.enable = true;
    services.xserver.videoDrivers = [ "nvidia" ];

    services.xserver.xkb = {
      layout = "at";
      variant = "nodeadkeys";
    };

    services.printing.enable = true;
  };
}
