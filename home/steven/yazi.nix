{pkgs, ...}: {
  programs.yazi = {
    enable = true;
    settings = {
      mgr = {
        show_hidden = true;
        sort_by = "alphabetical";
        sort_dir_first = true;
      };
    };
  };
  home.packages = with pkgs; [
    fd
    ffmpeg
    file
    zoxide
  ];
}
