{ inputs, ... }:

{
  imports = [
    inputs.quick-web-apps.homeManagerModules.default

    ../../desktop/gnome/settings.nix
    ../../desktop/gnome/theme.nix

    ../../packages/browser.nix
    ../../packages/communication.nix
    ../../packages/gaming.nix
    ../../packages/gnome.nix
    ../../packages/media.nix
    ../../packages/misc.nix
    ../../packages/utility.nix

    ../../programs/bash.nix
    ../../programs/git.nix
    ../../programs/nh.nix
    ../../programs/starship.nix
    ../../programs/thunderbird.nix
    ../../programs/vscodium.nix
    ../../programs/web-apps.nix
  ];

  home.username = "mathias";
  home.homeDirectory = "/home/mathias";
  xresources.properties = {
    "Xcursor.size" = 16;
    "Xft.dpi" = 172;
  };

  home.stateVersion = "25.11";
}
