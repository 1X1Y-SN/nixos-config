{hostName, ...}: {
  networking = {
    hostName = hostName;
    networkmanager.enable = true;
    firewall.allowedTCPPorts = [32400];
  };
}
