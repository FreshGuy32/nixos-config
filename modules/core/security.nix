{ den, ... }: {
  den.aspects.core.security.nixos = _: {
    security.pki.certificates = [
      (builtins.readFile ../../assets/RootCA.pem)
    ];
  };
}
