{...}: {
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
    daemon.settings = {
      features.cdi = true;
    };
    storageDriver = "btrfs";
  };
}
