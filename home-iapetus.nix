{ pkgs, ... }:
{
  imports = [
    ./home-common.nix
  ];

  home.packages = with pkgs; [
    vivaldi
    fuzzel

    nerd-fonts.iosevka
  ];

  fonts.fontconfig.enable = true;
  fonts.fontconfig.defaultFonts.monospace = [ "Iosevka Nerd Font Mono" ];

  programs.waybar = {
    enable = true;
    systemd.enable = true;
  };
  services.dunst.enable = true;
  services.network-manager-applet.enable = true;

}
