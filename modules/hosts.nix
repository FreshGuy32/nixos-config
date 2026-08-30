# defines all hosts + users + homes.
# then config their aspects in as many files you want
{
  # mathias user at pc host.
  den.hosts.x86_64-linux.pc = {
    hostName = "tower";

    users.mathias = { };
  };

  # define an standalone home-manager for mathias
  # den.homes.x86_64-linux.mathias = { };

  # be sure to add nix-darwin input for this:
  # den.hosts.aarch64-darwin.apple.users.alice = { };

  # other hosts can also have user mathias.
  # den.hosts.x86_64-linux.south = {
  #   wsl = { }; # add nixos-wsl input for this.
  #   users.mathias = { };
  #   users.orca = { };
  # };
}
