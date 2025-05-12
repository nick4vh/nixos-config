{ config, pkgs, lib, ... }:

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

    #ChatAI
    kdePackages.qtwebengine

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

    "autostart/nextcloud.desktop".text = ''
      [Desktop Entry]
      Type=Application
      Exec=nextcloud
      Hidden=false
      X-GNOME-Autostart-enabled=true
      Name=Nextcloud
    '';
  };

  # Theme Settings
  # Fonts
  #fonts.fontconfig.enable = true;
/*
  # KDE spezifische Konfigs
  xdg.configFile."kdeglobals".text = ''
    [General]
    ColorScheme=BreezeDark

    [Icons]
    Theme=Tela-dark

    [KDE]
    LookAndFeelPackage=org.kde.breezedark

    [CursorTheme]
    name=Bibata-Modern-Ice

    [WM]
    LookAndFeelPackage=org.kde.breezedark
  '';

  xdg.configFile."plasmarc".text = ''
    [Theme]
    name=BreezeDark
  '';

  xdg.configFile."kdeglobals".force = true;
  xdg.configFile."plasmarc".force = true;

  xdg.configFile."kcminputrc".text = ''
    [Mouse]
    cursorTheme=Bibata-Modern-Ice
  '';
*/
/*
  home.activation.setWallpaper = lib.hm.dag.entryAfter ["writeBoundary"] ''
    # Nur qdbus, ohne plasmashell --replace!
    ${pkgs.kdePackages.qttools}/bin/qdbus org.kde.plasmashell /PlasmaShell org.kde.PlasmaShell.evaluateScript '
    var allDesktops = desktops();
    for (i=0;i<allDesktops.length;i++) {
      d = allDesktops[i];
      d.wallpaperPlugin = "org.kde.image";
      d.currentConfigGroup = Array("Wallpaper", "org.kde.image", "General");
      d.writeConfig("Image", "file:/wallpaper/nixos_wallpaper_1920-1080.jpg");
     }'
  '';
*/

  # App Settings
  programs.git = {
    enable = true;
    userName = "nick4vh";
    userEmail = "nick@viereggeheyng.de";
  };

/*
  programs.firefox = {
    enable = true;

    # Profile definieren
    profiles.default = {
      id = 0;
      isDefault = true;

      # Erweiterungen (Add-ons)
      extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        ublock-origin
        darkreader
      ];

      # Einstellungen (prefs.js)
      settings = {
        "browser.startup.page" = 3;  # 3 bedeutet "Letzte Sitzung"
        "browser.startup.homepage" = "about:home";
        "browser.search.defaultenginename" = "Ecosia";  # Ecosia als Standard-Suchmaschine
        "privacy.resistFingerprinting" = true;
        "privacy.trackingprotection.enabled" = true;
        "browser.tabs.warnOnClose" = false;

        # Deaktivieren von Telemetrie und Firefox-Konten
        "datareporting.healthreport.uploadEnabled" = false;
        "app.shield.optoutstudies.enabled" = false;
        "browser.ping-centre.telemetry" = false;
        "services.sync.enabled" = false;
      };
    };
  };
*/

}
