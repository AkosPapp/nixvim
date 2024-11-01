{mkPlugin, ...}: {
  colorschemes.dracula-nvim = {
    enable = true;
    settings = {
      show_end_of_buffer = true; # default false
      # use transparent background
      transparent_bg = true; # default false
      # set custom lualine background color
      lualine_bg_color = "#44475a"; # default nil
      # set italic comment
      italic_comment = true; # default false
    };
  };
}
