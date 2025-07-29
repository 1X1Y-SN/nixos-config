{...}: {
  system = {
    stateVersion = "25.05";
  };

  imports = [
    ./boot.nix
    ./disko-config.nix
    ./filesystems.nix
    ./hardware.nix
    ./hardware-configuration.nix
    ./locale.nix
    ./networking.nix
    ./nix.nix
    ./packages.nix
    ./programs.nix
    ./services.nix
    ./users.nix
  ];
}
