{...}: {
  imports = [
    ./boot.nix
    ./disko-config.nix
    ./filesystems.nix
    ./hardware.nix
    ./hardware-configuration.nix
    ./networking.nix
    ./packages.nix
    ./services.nix
    ./users.nix
  ];

  system.stateVersion = "25.05";

  nix.settings.experimental-features = ["nix-command" "flakes"];

  time.timeZone = "America/Toronto";
  i18n.defaultLocale = "en_CA.UTF-8";
}
