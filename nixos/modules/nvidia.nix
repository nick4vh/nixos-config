{ config, pkgs, lib, ... }:

{
  # Aktiviert OpenGL für NVIDIA-Grafik
  hardware.graphics = {
    enable = true;
  };

  # NVIDIA-Treiber aktivieren
  hardware.nvidia = {
    #open = true;  # Falls du neuere NVIDIA-Karten hast (z.B. RTX/GTX 16xx)
    modesetting.enable = true;
    package = pkgs.linuxPackages.nvidiaPackages.latest;  # Benutze die neueste Version
    powerManagement.enable = true;
  };


  hardware.nvidia.prime = {
    #sync.enable = true;

    offload = {
      enable = true;
      enableOffloadCmd = true;
    };

    # integrated
    # amdgpuBusId = "PCI:6:0:0"
    intelBusId = "PCI:0:0:0";

    # dedicated
    nvidiaBusId = "PCI:1:0:0";
  };


  specialisation = {
    gaming-time.configuration = {

      hardware.nvidia = {
        prime.sync.enable = lib.mkForce true;
        prime.offload = {
          enable = lib.mkForce false;
          enableOffloadCmd = lib.mkForce false;
        };
      };

    };
  };

  # Xorg Server für NVIDIA
  #services.xserver = {
  #  enable = true;
  #  videoDrivers = [ "nvidia" ];  # Benutzt den NVIDIA-Treiber für Xorg
  #};


  ##wrappers
  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
  programs.gamemode.enable = true;

  environment.systemPackages = with pkgs; [
    mangohud
    protonup
  ];

  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS =
      "\${HOME}/.steam/root/compatibilitytools.d";
  };

}
