{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    curl
    docker-compose
    git
    nvidia-docker
    wget
  ];
}
