{ den, ... }: {
  den.aspects.apps.dev.nixos = {
    homeManager =
      { pkgs, ... }:
      {
        home.packages = with pkgs; [
          nixfmt
          nixd
          nix-output-monitor
        ];
      };
  };
}
