{ config, pkgs, ... }:

{
  imports = [
    ../modules/nvidia.nix
    # ../modules/stylix-settings.nix
  ];

  services.xserver = {
    enable = true;
    layout = "de";
    xkbVariant = ""; # optional – du kannst z. B. "nodeadkeys" setzen
  };

  services.desktopManager.plasma6.enable = true;

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true; #  Explizit SDDM im Wayland-Modus
  };

  console.useXkbConfig = true;

  # NVIDIA Wayland-Kompatibilität
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

  virtualisation.libvirtd.enable = true;
  boot.kernelModules = [ "kvm-intel" ];
  users.users.nick.extraGroups = [ "libvirtd" "kvm" ];

  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [ 5900 5901 ];

  networking.networkmanager.enable = true;

  environment.systemPackages = with pkgs; [
    # Development
    vscodium vim nodejs yarn git wget

    # Browser
    firefox chromium brave

    # Tools
    htop btop kdePackages.kdeconnect-kde clamav

    # Themes / Icons
    jetbrains-mono inter noto-fonts tela-icon-theme bibata-cursors
  ];

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

  hardware.opengl.enable = true;

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
    serviceConfig.Type = "oneshot";
  };
}
