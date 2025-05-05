{ config, pkgs, ... }:

{
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
    vscode
    vim
    nodejs
    yarn
    git
    wget
    docker
    postman

    #Design
    inkscape
    gimp
    krita
    kdePackages.kdenlive

    #Browser
    firefox
    chromium
    brave

    # Gaming
    vulkan-tools
    steam
    lutris
    wine
    retroarch
    pcsx2
    discord

    # Tools
    obs-studio
    bitwarden-desktop
    nextcloud-client
    evolution
    zsh
    fish
    vlc
    mpv
    htop
    btop
    kdePackages.kdeconnect-kde

  ];
}
