{ config, pkgs, ... }:

{
  home.username = "nick";
  home.homeDirectory = "/home/nick";

  home.sessionVariables = {
  LANG = "de_DE.UTF-8";
  LC_ALL = "de_DE.UTF-8";
  };

  programs.home-manager.enable = true;

  programs.zsh.enable = true;
  home.packages = with pkgs; [
    #Development
    vscodium
    neovim
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
    joplin
    nextcloud-client
    evolution
    zsh
    fish
    vlc
    spotify
    kdePackages.kdeconnect-kde
    mpv
    alacritty
    htop
    btop
    neofetch
    fastfetch
  ];


  # XDG-Einstellungen aktivieren
  xdg = {
    enable = true;

    mimeApps = {
      enable = true;
      defaultApplications = {
        # Standardanwendungen setzen
        "text/plain" = "vscodium.desktop";
        "text/html" = "firefox.desktop";
        "text/nix" = "vscodium.desktop";
        "application/x-nix" = "vscodium.desktop";
        "text/js" = "vscodium.desktop";
        "text/css" = "vscodium.desktop";
        "text/php" = "vscodium.desktop";
        "text/vue" = "vscodium.desktop";
        "text/yml" = "vscodium.desktop";
        "text/json" = "vscodium.desktop";
        "application/pdf" = "org.kde.okular.desktop";
        "image/png" = "org.kde.gwenview.desktop";
        "image/jpg" = "org.kde.gwenview.desktop";
        "x-scheme-handler/http" = "firefox.desktop";
        "x-scheme-handler/https" = "firefox.desktop";
        "inode/directory" = "org.kde.dolphin.desktop";
      };
    };
  };

  home.stateVersion = "24.05";
}
