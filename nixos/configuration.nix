{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./hosts/mein-pc.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "mein-pc";
  time.timeZone = "Europe/Berlin";

  users.users.nick = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.zsh;
  };

  services.openssh.enable = true;
  system.stateVersion = "24.05";
}
