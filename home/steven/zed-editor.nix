{...}: {
  programs.zed-editor = {
    enable = true;
    userSettings = {
      ui_font_size = 16;
      buffer_font_size = 16;
      theme = {
        mode = "system";
        light = "One Dark";
        dark = "One Dark";
      };
      lsp = {
        nil = {
          initialization_options = {
            formatting = {
              command = ["alejandra"];
            };
          };
        };
      };
    };
  };
}
