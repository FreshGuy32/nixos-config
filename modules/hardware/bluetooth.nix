{ den, ... }: {
  den.aspects.hardware.bluetooth = _: {
    nixos = _: {
      hardware.bluetooth.enable = true;
    };

    persist.directories = [ "/var/lib/bluetooth" ];
  };
}
