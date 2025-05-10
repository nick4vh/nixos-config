{ config, pkgs, lib, ... }:

{
  stylix = {
    enable = true;

    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-material-dark-medium.yaml";

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.fira-code;
        name = "FiraCode Nerd Font";
      };

      sansSerif = {
        package = pkgs.noto-fonts;
        name = "Noto Sans";
      };

      serif = {
        package = pkgs.noto-fonts;
        name = "Noto Serif";
      };

      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
    };


    #image = wallpaper;

    iconTheme = {
      enable = true;
      package = pkgs.tela-circle-icon-theme;
      light = "Tela-circle-light";
      dark = "Tela-circle-dark";
    };

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };

    #targets.plasma.enable = true;
  };

  # Notwendige Pakete
  environment.systemPackages = with pkgs; [
    jetbrains-mono
    inter
    noto-fonts
    tela-icon-theme
    bibata-cursors
  ];
}
