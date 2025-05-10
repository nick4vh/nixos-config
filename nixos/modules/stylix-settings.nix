{ config, pkgs, lib, ... }:

{
  stylix = {
    enable = true;

    base16Scheme = "catppuccin-mocha";

    fonts = {
      monospace = "JetBrainsMono Nerd Font";
      sansSerif = "Inter";
      serif = "Noto Serif";
      sizes = {
        applications = 10;
        terminal = 11;
        desktop = 10;
      };
    };

    image = ./../wallpaper/nixos_wallpaper_1920-1080.jpg;

    iconTheme = {
      package = pkgs.tela-icon-theme;
      name = "Tela-dark";
    };

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
    };

    targets.plasma.enable = true;
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
