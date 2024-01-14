{ pkgs, ... }:
{
  home.packages = [ pkgs.kitty ];
  imports = [ ./colors/moonlight.nix ];
  programs.kitty = {
    enable = true;
    font = {
      size = 12;
      name = "FiraCode Nerd Font";
    };
    settings = {
      tab_fade = 1;
      tab_bar_style = "fade";
      cursor_shape = "underline";
    };
  };
}