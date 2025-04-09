{ pkgs, ... }:
{
  imports = [
    ./home-common.nix
  ];

  home.packages = with pkgs; [
    vivaldi
  ];

  services.dunst.enable = true;

}
