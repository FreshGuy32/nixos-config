{ den, ... }:
let
  fontPkgs = pkgs: [
    pkgs.dejavu_fonts
    pkgs.fira-code
    pkgs.hack-font
    pkgs.ibm-plex
    pkgs.inconsolata
    pkgs.liberation_ttf
    pkgs.nerd-fonts.dejavu-sans-mono
    pkgs.nerd-fonts.caskaydia-mono
    pkgs.noto-fonts
    pkgs.roboto
    pkgs.roboto-mono
    pkgs.source-code-pro
    pkgs.ttf_bitstream_vera
  ];
in
{
  den.aspects.desktop.fonts = {
    description = "A system font set, with the same set offered as a provides.home sub-aspect for standalone homes.";

    nixos =
      { pkgs, ... }:
      {
        fonts.packages = fontPkgs pkgs;
      };

    provides.home.homeManager =
      { pkgs, ... }:
      {
        home.packages = fontPkgs pkgs;
        fonts.fontconfig.enable = true;
      };
  };
}
