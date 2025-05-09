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
    open = false;
    nvidiaSettings = true;
  };

  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    jack.enable = true;
  };

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
  networking.firewall.enable = true;

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
    clamav #Antivirenschutz
  ];

  #Performance-Optimierungen
  boot.kernel.sysctl = {
    "vm.swappiness" = 10;
    "vm.dirty_ratio" = 15;
    "vm.dirty_background_ratio" = 5;
    "kernel.nmi_watchdog" = 0;
  };

  zramSwap = {
    enable = true;
    memoryPercent = 50;
  };

  systemd.extraConfig = ''
    DefaultTimeoutStartSec=5s
    DefaultTimeoutStopSec=5s
  '';

  systemd.services."NetworkManager-wait-online".enable = false;

  services.journald.extraConfig = ''
    SystemMaxUse=200M
    RuntimeMaxUse=100M
  '';

  hardware.opengl = {
    enable = true;
  };

  # Schnellerer Boot mit systemd-boot
  #boot.loader.systemd-boot.enable = true;
  #boot.loader.timeout = 0;

  #Automatische Aufräumdienste
  systemd.timers."nix-gc" = {
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = "weekly";
      Persistent = true;
    };
  };

  systemd.services."nix-gc" = {
    script = ''
      nix-collect-garbage -d
      journalctl --vacuum-time=7d
    '';
    serviceConfig = {
      Type = "oneshot";
    };
  };
}
