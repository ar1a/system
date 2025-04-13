{ pkgs, catppuccin, ... }:
{
  imports = [
    ./home-common.nix
    catppuccin.homeModules.catppuccin
  ];

  home.packages = with pkgs; [
    vivaldi
    wl-clipboard-rs
    foot
    libnotify # for notify-send
    gcr

    nerd-fonts.iosevka
  ];

  catppuccin.flavor = "frappe";
  catppuccin.fuzzel.enable = true;
  catppuccin.dunst.enable = true;
  catppuccin.cursors.enable = true;

  programs.waybar = {
    enable = true;
    systemd.enable = true;
  };
  programs.fuzzel.enable = true;
  services.dunst = {
    enable = true;
  };
  services.network-manager-applet.enable = true;

  services.gnome-keyring.enable = true;

  fonts.fontconfig.enable = true;
  fonts.fontconfig.defaultFonts.monospace = [ "Iosevka Nerd Font Mono" ];

  home.pointerCursor = {
    gtk.enable = true;
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
