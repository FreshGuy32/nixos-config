{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nixfmt
    nixd
    nix-output-monitor
  ];
}
