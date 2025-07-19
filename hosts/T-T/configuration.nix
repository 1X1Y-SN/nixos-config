{
  config,
  pkgs,
  hostName,
  user,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
  ];

  system.stateVersion = "25.05";

  nix.settings.experimental-features = ["nix-command" "flakes"];

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      efi.efiSysMountPoint = "/boot";
    };
  };

  fileSystems = {
    "/boot" = {
      device = "/dev/nvme0n1p1";
      fsType = "vfat";
      options = ["defaults"];
    };
    "/" = {
      device = "/dev/nvme0n1p2";
      fsType = "btrfs";
      options = ["noatime" "compress=zstd" "space_cache=v2" "discard=async" "subvol=@"];
    };
    "/home" = {
      device = "/dev/nvme0n1p2";
      fsType = "btrfs";
      options = ["noatime" "compress=zstd" "space_cache=v2" "discard=async" "subvol=@home"];
    };
    "/nix" = {
      device = "/dev/nvme0n1p2";
      fsType = "btrfs";
      options = ["noatime" "compress=zstd" "space_cache=v2" "discard=async" "subvol=@nix"];
    };
    "/mnt/samsung-ssd-860" = {
      device = "/dev/sda1";
      fsType = "btrfs";
      options = ["noatime" "compress=zstd" "space_cache=v2" "discard=async"];
    };
  };

  zramSwap = {
    enable = true;
    memoryPercent = 50;
  };

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    nvidia = {
      modesetting.enable = true;
      powerManagement = {
        enable = false;
        finegrained = false;
      };
      open = true;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
    nvidia-container-toolkit = {
      enable = true;
    };
  };

  networking = {
    hostName = hostName;
    networkmanager.enable = true;
    firewall.allowedTCPPorts = [32400];
  };

  time.timeZone = "America/Toronto";
  i18n.defaultLocale = "en_CA.UTF-8";

  services = {
    xserver.videoDrivers = ["nvidia"];
    udisks2 = {
      enable = true;
    };
    openssh = {
      enable = true;
      settings = {
        X11Forwarding = true;
        PermitRootLogin = "no";
        PasswordAuthentication = false;
      };
      openFirewall = true;
    };
    pipewire = {
      enable = true;
      pulse.enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      wireplumber.enable = true;
    };
  };

  virtualisation.docker = {
    enable = true;
    enableNvidia = true;
    daemon.settings = {
      features.cdi = true;
    };
    storageDriver = "btrfs";
  };

  users.users.${user} = {
    isNormalUser = true;
    description = user;
    extraGroups = ["docker" "networkmanager" "wheel"];
    #   packages = with pkgs; [
    #     tree
    #   ];
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    alacritty
    curl
    docker-compose
    git
    helix
    nvidia-docker
    wget
  ];

  programs.nix-ld.enable = true;
}
