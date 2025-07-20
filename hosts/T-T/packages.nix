{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    curl
    docker-compose
    git
    nvidia-docker
    wget
  ];
}
