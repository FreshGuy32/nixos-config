{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gnomeExtensions.dash-to-dock
    gnomeExtensions.auto-accent-colour
    gnomeExtensions.accent-directories
    gnomeExtensions.dynamic-music-pill

    morewaita-icon-theme
  ];
}
