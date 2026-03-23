{ pkgs, ... }:

{
  home.packages = with pkgs; [
    legcord
    signal-desktop
  ];
}
