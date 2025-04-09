{ pkgs, ... }:
{
  imports = [
    ./home-common.nix
  ];

  home.packages = with pkgs; [
    vivaldi
    fuzzel
  ];

  services.dunst.enable = true;

}
