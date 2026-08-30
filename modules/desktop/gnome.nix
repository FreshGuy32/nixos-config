{ den, ... }: {
  den.aspects.desktop.gnome = {
    nixos = { ... }: {
      programs.dconf.enable = true;
    };

    provides.to-users.homeManager = { pkgs, ... }: {
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
              "com.heroicgameslauncher.hgl.desktop"
              "codium.desktop"
            ];
            enabled-extensions = with pkgs.gnomeExtensions; [
              dash-to-dock.extensionUuid
              auto-accent-colour.extensionUuid
              accent-directories.extensionUuid
              dynamic-music-pill.extensionUuid
            ];
            last-selected-power-profile = "balanced";
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

      gtk = {
        enable = true;
        theme = {
          name = "Adwaita-dark";
          package = pkgs.gnome-themes-extra;
        };
        iconTheme = {
          name = "MoreWaita";
          package = pkgs.morewaita-icon-theme;
        };
        gtk4.theme = null;
      };

      qt = {
        enable = true;
        platformTheme.name = "Adwaita-dark";
        style = {
          name = "Adwaita-dark";
          package = pkgs.adwaita-qt;
        };
      };

    };
  };
}
