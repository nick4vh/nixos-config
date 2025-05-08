{ config, pkgs, ... }:

{

  imports = [
    ../modules/nvidia.nix
  ];

  services.xserver = {
    enable = true;
    desktopManager.plasma6.enable = true;
    displayManager.sddm.enable = true;
    xkb.layout = "de";
  };

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    package = config.boot.kernelPackages.nvidiaPackages.latest;
  };

  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    jack.enable = true;
  };

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  networking.networkmanager.enable = true;

  environment.systemPackages = with pkgs; [
    #Development
    vscodium
    vim
    nodejs
    yarn
    git
    wget

    #Browser
    firefox
    chromium
    brave

    # Tools
    htop
    btop
    kdePackages.kdeconnect-kde
  ];
}
