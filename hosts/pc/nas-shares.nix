{ lib, pkgs, ... }:

let
  shares = [
    {
      source = "Documents";
      target = "Documents";
    }
    {
      source = "Media/movies";
      target = "Videos/movies";
    }
    {
      source = "Media/music";
      target = "Music";
    }
    {
      source = "Media/photos";
      target = "Pictures";
    }
    {
      source = "Media/shows";
      target = "Videos/shows";
    }
  ];

  commonOptions = [
    "x-systemd.automount"
    "noauto"
    "x-systemd.idle-timeout=600"
    "x-systemd.mount-timeout=15"
    "_netdev"

    "uid=1000,gid=100"
    "file_mode=0664,dir_mode=0755"

    "username=mtrapl"
    "password=1w2Q3r4E;"

    "noatime" # avoid atime updates
    "cache=loose" # trust client cache more (fewer revalidations)
    "echo_interval=600" # fewer keepalives

    "vers=3.1.1"

    "x-gvfs-hide"
  ];

  server = "//192.168.178.27";
in
{
  fileSystems = lib.listToAttrs (
    map (share: {
      name = "/home/mathias/${share.target}";
      value = {
        device = "${server}/${share.source}";
        fsType = "cifs";
        options = commonOptions;
      };
    }) shares
  );

  services.gvfs.enable = true;
  boot.supportedFilesystems = [ "cifs" ];

  environment.systemPackages = [ pkgs.cifs-utils ];
}
