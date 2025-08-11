{...}: {
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = ["$HOME/Pictures/wallpapers/synthwave.jpg"];
      wallpaper = ["DP-1, $HOME/Pictures/wallpapers/synthwave.jpg"];
    };
  };
}
