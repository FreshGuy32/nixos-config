{ den, ... }:

{
  den.aspects.apps.dev.vscodium = {
    includes = [
      (den.batteries.unfree [
        "vscode-extension-ms-dotnettools-csdevkit"
        "vscode-extension-ms-vscode-remote-remote-containers"
        "vscode-extension-ms-vscode-remote-remote-ssh"
      ])
    ];

    home-persist.directories = [
      ".config/VSCodium"
      ".vscode-oss"
      ".vscode-oss-shared"
    ];

    homeManager =
      { pkgs, ... }:
      {
        programs.vscodium = {
          enable = true;
          package = pkgs.vscodium;
          mutableExtensionsDir = false;

          profiles.default = {
            enableExtensionUpdateCheck = false;
            enableUpdateCheck = false;
            userSettings = {
              "workbench.iconTheme" = "material-icon-theme";
              "window.titleBarStyle" = "custom";
              "git.autofetch" = true;
              "git.confirmSync" = false;
            };
            extensions = with pkgs.vscode-extensions; [
              pkief.material-icon-theme
            ];
          };

          profiles."C#" = {
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
      };
  };
}
