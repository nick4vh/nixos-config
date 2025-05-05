{ config, pkgs, ... }:

{
  home.username = "nick";
  home.homeDirectory = "/home/nick";

  programs.home-manager.enable = true;

  programs.zsh.enable = true;
  home.packages = with pkgs; [
    neofetch btop fastfetch
  ];

  home.stateVersion = "24.05";
}
