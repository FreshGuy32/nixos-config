{ den, inputs, ... }: {
  den.aspects.core.nix.nixos =
    { lib, ... }:
    {
      nix = {
        registry.nixpkgs.flake = inputs.nixpkgs;

        settings = {
          connect-timeout = 5;
          log-lines = 25;

          auto-optimise-store = true;

          allow-import-from-derivation = true;

          warn-dirty = false;
          experimental-features = [
            "nix-command"
            "flakes"
          ];
          max-jobs = "auto";
          cores = 0;
          show-trace = true;
          sandbox = true;
          keep-build-log = true;
          fallback = true;

          # Free space mid-build once under 512MB, up to 1GB. mkDefault so a
          # host with a small disk can lower it.
          min-free = lib.mkDefault 536870912;
          max-free = lib.mkDefault 1073741824;
        };

        gc = {
          automatic = true;
          dates = "weekly";
          options = "--delete-older-than 30d";
        };
      };

      programs.nix-ld.enable = true;
    };
}
