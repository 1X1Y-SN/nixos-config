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
    alejandra
    firefox
    hyprpaper
    hyprpolkitagent
    kdePackages.dolphin
    kdePackages.kio-extras
    nerd-fonts.jetbrains-mono
    nil
    nixd
    qt6.qtwayland
    wofi
  ];

  fonts.fontconfig = {
    enable = true;
    defaultFonts.monospace = ["JetBrainsMono Nerd Font Mono"];
  };

  imports = [
    ./hyprland.nix
    ./waybar.nix
    ./zed-editor.nix
  ];
}
