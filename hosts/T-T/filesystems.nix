{...}: {
  fileSystems = {
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
}
