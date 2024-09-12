{ pkgs, ... }:
{
  home.packages = [ pkgs.zed-editor ];
  xdg.configFile."zed/keymap.json".text = import ./keymaps.nix;

  xdg.configFile."zed/settings.json".text = /* json */ ''
    {
      "vim_mode": true,
      "git_status": true,
      "ui_font_size": 15,
      "buffer_font_size": 14,
      "theme": "poimandres blurry",
      "tabs": { "git_status": true },
      "scrollbar": { "show": "never" },
      "buffer_font_family": "JetBrainsMono Nerd Font",
      "terminal": { "font_family": "JetBrainsMono Nerd Font" },

      "languages": {
        "JavaScript": { "tab_size": 2 }
      }
    }
  '';
}