{ den, ... }: {
  den.aspects.pc = {
    includes = [
      (den.batteries.unfree [
        "nvidia-x11"
        "nvidia-settings"
      ])

      den.aspects.core.boot
      den.aspects.core.locale
      den.aspects.core.services

      den.aspects.hardware.audio
      den.aspects.hardware.bluetooth
      den.aspects.hardware.graphics
    ];

    nixos = { config, ... }: {
      imports = [
        ./_hardware.nix
      ];

      hardware.nvidia = {
        open = true;
        modesetting.enable = true;
        nvidiaSettings = true;

        package = config.boot.kernelPackages.nvidiaPackages.production;
      };
      hardware.nvidia-container-toolkit.enable = true;
    };
  };
}
