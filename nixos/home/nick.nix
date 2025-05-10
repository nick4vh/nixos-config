{ config, pkgs, ... }:

{
  home.username = "nick";
  home.homeDirectory = "/home/nick";

  home.sessionVariables = {
  LANG = "de_DE.UTF-8";
  LC_ALL = "de_DE.UTF-8";
  };

  home.stateVersion = "24.05";

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
    libreoffice-qt6-fresh
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
    clamav #Antivirenschutz

    # KVM
    virt-manager      # GUI zur Verwaltung von VMs
    virt-viewer       # Anzeige-Tool für VMs
    qemu              # Virtualisierung
    libvirt           # Virtualisierungs-Backend
    dnsmasq           # DHCP für virtuelle Netzwerke
    bridge-utils      # Netzwerk-Bridge Support
    spice-gtk         # SPICE Support (grafische Darstellung)

    # KDE Theme
    # Schriftarten
    noto-fonts
    noto-fonts-emoji
    noto-fonts-cjk-sans
    nerd-fonts.fira-code

    # Icon-Theme
    tela-icon-theme
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

  # Deaktiviert das Wiederherstellen der letzten Sitzung
  home.file.".config/ksmserverrc".text = ''
    [General]
    loginMode=emptySession
  '';

  # Autostart-Einträge
  xdg.configFile = {
    "autostart/spotify.desktop".text = ''
      [Desktop Entry]
      Type=Application
      Exec=spotify
      Hidden=false
      X-GNOME-Autostart-enabled=true
      Name=Spotify
    '';

    "autostart/discord.desktop".text = ''
      [Desktop Entry]
      Type=Application
      Exec=discord
      Hidden=false
      X-GNOME-Autostart-enabled=true
      Name=Discord
    '';

    "autostart/firefox.desktop".text = ''
      [Desktop Entry]
      Type=Application
      Exec=firefox
      Hidden=false
      X-GNOME-Autostart-enabled=true
      Name=Firefox
    '';

    "autostart/nextcloud-client.desktop".text = ''
      [Desktop Entry]
      Type=Application
      Exec=nextcloud-client
      Hidden=false
      X-GNOME-Autostart-enabled=true
      Name=Nextcloud
    '';
  };

  #Theme Settings

  # Cursor
  home.pointerCursor = {
    name = "Bibata-Modern-Ice";
    package = pkgs.bibata-cursors;
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };

  # Fonts
  fonts.fontconfig.enable = true;
/*
  # GTK-Themes (wird auch von einigen KDE-Anwendungen verwendet)
  gtk = {
    enable = true;
    theme.name = "Breeze"; # Oder z. B. "Adwaita-dark"
    iconTheme.name = "Tela-dark";
    font.name = "Noto Sans";
  };

  # KDE spezifische Konfigs
  xdg.configFile."kdeglobals".text = ''
    [General]
    fixed = FiraCode Nerd Font,11
    font = Noto Sans,10,-1,5,50,0,0,0,0,0

    [Icons]
    Theme=Tela-dark

    [WM]
    activeFont=Noto Sans,10,-1,5,50,0,0,0,0,0
  '';
*/
  # App Settings
  programs.git = {
    enable = true;
    userName = "nick4vh";
    userEmail = "nick@viereggeheyng.de";
  };

}
