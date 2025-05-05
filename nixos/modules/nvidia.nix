{ config, pkgs, lib, ... }:

{
  # Aktiviert OpenGL für NVIDIA-Grafik
  hardware.opengl = {
    enable = true;
  };

  # NVIDIA-Treiber aktivieren
  hardware.nvidia = {
    open = true;  # Falls du neuere NVIDIA-Karten hast (z.B. RTX/GTX 16xx)
    modesetting.enable = true;
    package = pkgs.linuxPackages.nvidiaPackages.latest;  # Benutze die neueste Version
    powerManagement.enable = true;
  };

  # Xorg Server für NVIDIA
  services.xserver = {
    enable = true;
    videoDrivers = [ "nvidia" ];  # Benutzt den NVIDIA-Treiber für Xorg
  };

  # Optional: Wenn du Optimus mit NVIDIA und Intel hast
  # prime = {
  #   offload.enable = true;
  #   sync.enable = true;
  # };
}
