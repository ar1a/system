{ pkgs, ... }:
{
  imports = [
    ./home-common.nix
  ];

  home.packages = with pkgs; [
    vivaldi
    fuzzel
    wl-clipboard-rs
    foot

    nerd-fonts.iosevka
  ];

  programs.waybar = {
    enable = true;
    systemd.enable = true;
  };
  services.dunst.enable = true;
  services.network-manager-applet.enable = true;

  fonts.fontconfig.enable = true;
  fonts.fontconfig.defaultFonts.monospace = [ "Iosevka Nerd Font Mono" ];

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
  };

  gtk = {
    enable = true;
    theme = {
      package = pkgs.flat-remix-gtk;
      name = "Flat-Remix-GTK-Grey-Darkest";
    };

    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };

    font = {
      name = "sansserif";
      size = 11;
    };
  };
}
