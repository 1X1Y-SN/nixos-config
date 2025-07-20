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
    kdePackages.dolphin
    kdePackages.kio-extras
    nerd-fonts.jetbrains-mono
    qt6.qtwayland
  ];

  fonts.fontconfig = {
    enable = true;
    defaultFonts.monospace = ["JetBrainsMono Nerd Font Mono"];
  };

  imports = [
    ./alacritty.nix
    ./firefox.nix
    ./helix.nix
    ./hyprland.nix
    ./waybar.nix
    ./wofi.nix
    ./zed-editor.nix
  ];
}
