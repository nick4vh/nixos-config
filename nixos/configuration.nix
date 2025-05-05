{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./hosts/mein-pc.nix
    ./modules/nvidia.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "mein-pc";
  time.timeZone = "Europe/Berlin";

  users.users.nick = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.zsh;
  };
  programs.zsh.enable = true;

  nixpkgs.config.allowUnfree = true;

  services.openssh.enable = true;
  system.stateVersion = "24.05";

  boot.loader.grub = {
    enable = true;
    version = 2;
    device = "/dev/sda"; # Wichtig: Nicht sda1 oder sda2, sondern die ganze Disk
  };
  boot.loader.efi = {
    canTouchEfiVariables = false; # sicherheitshalber
  };
}
