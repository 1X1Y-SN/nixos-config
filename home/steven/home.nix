{
  pkgs,
  user,
  ...
}: {
  home = {
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = "25.05";
  };

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    hyprpaper
    hyprpolkitagent
    nerd-fonts.jetbrains-mono
    qt6.qtwayland
    transmission_4-qt
  ];

  home.file."Pictures".source = "/mnt/samsung-ssd-860/Pictures";

  fonts.fontconfig = {
    enable = true;
    defaultFonts.monospace = ["JetBrainsMono Nerd Font Mono"];
  };

  imports = [
    ./alacritty.nix
    ./bottom.nix
    ./firefox.nix
    ./helix.nix
    ./hyprland.nix
    ./hyprlock.nix
    ./waybar.nix
    ./wofi.nix
    ./yazi.nix
    ./zed-editor.nix
  ];
}
