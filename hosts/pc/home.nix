{ pkgs, ... }:

{
  home.username = "mathias";
  home.homeDirectory = "/home/mathias";
  xresources.properties = {
    "Xcursor.size" = 16;
    "Xft.dpi" = 172;
  };

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

      "org/gnome/shell/extensions/dash-to-doc" = {
        show-apps-at-top = true;
        show-mounts-network = true;
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

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    google-chrome
    spotify

    legcord
    signal-desktop

    steam
    lutris

    gnomeExtensions.dash-to-dock
    gnomeExtensions.auto-accent-colour
    gnomeExtensions.accent-directories
    gnomeExtensions.dynamic-music-pill

    morewaita-icon-theme

    nixfmt
    nixd
    nix-output-monitor
    gnome-boxes
    switcheroo
    vlc
    solaar
    dconf-editor
  ];

  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    settings.user = {
      name = "FreshGuy32";
      email = "mathias.trapl@gmail.com";
    };
  };

  # starship - an customizable prompt for any shell
  programs.starship = {
    enable = true;
    # custom settings
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
    };
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
  };

  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

    profiles.default = {
      enableExtensionUpdateCheck = false;
      enableUpdateCheck = false;
      userSettings = {
        "workbench.iconTheme" = "material-icon-theme";
        "window.titleBarStyle" = "custom";
        "git.autofetch" = true;
      };
      extensions = with pkgs.vscode-extensions; [
        pkief.material-icon-theme
      ];
    };

    profiles."CS" = {
      extensions = with pkgs.vscode-extensions; [
        eamodio.gitlens
        ms-vscode-remote.remote-containers
        ms-vscode-remote.remote-ssh
        pkief.material-icon-theme

        ms-dotnettools.csdevkit
      ];
    };
    profiles."NX NixOS" = {
      extensions = with pkgs.vscode-extensions; [
        eamodio.gitlens
        pkief.material-icon-theme

        jnoortheen.nix-ide
      ];
    };
    profiles."TS TypeScript" = {
      extensions =
        with pkgs.vscode-extensions;
        [
          eamodio.gitlens
          ms-vscode-remote.remote-containers
          ms-vscode-remote.remote-ssh
          pkief.material-icon-theme

          dbaeumer.vscode-eslint
          esbenp.prettier-vscode
        ]
        ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
          {
            name = "explorer";
            publisher = "vitest";
            version = "1.48.1";
            sha256 = "14avm20shh6hnap11rbgvyhixw7h8wyfls8z6iiyf2d9hnaixbj5";
          }
        ];
    };
  };

  programs.nh = {
    enable = true;
    flake = "/home/mathias/nixos-config";
  };

  home.stateVersion = "25.11";
}
