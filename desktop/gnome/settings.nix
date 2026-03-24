{ pkgs, ... }:

{
  dconf = {
    settings = {
      "org/gnome/desktop/background" = {
        color-shading-type = "solid";
        picture-uri = "file:///home/mathias/nixos-config/assets/bg-image.jpg";
        picture-uri-dark = "file:///home/mathias/nixos-config/assets/bg-image.jpg";
      };
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
      "org/gnome/shell" = {
        favorite-apps = [
          "org.gnome.Nautilus.desktop"
          "google-chrome.desktop"
          "code.desktop"
          "spotify.desktop"
          "org.gnome.Console.desktop"
          "steam.desktop"
        ];
        enabled-extensions = with pkgs.gnomeExtensions; [
          dash-to-dock.extensionUuid
          auto-accent-colour.extensionUuid
          accent-directories.extensionUuid
          dynamic-music-pill.extensionUuid
        ];
        last-selected-power-profile = "performance";
      };

      "org/gnome/shell/extensions/dash-to-dock" = {
        show-mounts-network = true;
        apply-custom-theme = true;
      };

      "org/gnome/shell/extensions/dynamic-music-pill" = {
        pill-dynamic-width = true;
        scroll-action = "volume";
      };
    };
  };
}
