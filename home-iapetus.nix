{ pkgs, ... }:
{
  imports = [
    ./home-common.nix
  ];

  home.packages = with pkgs; [
    vivaldi
    fuzzel

    iosevka
    nerd-fonts.symbols-only
    (stdenv.mkDerivation {
      inherit (nerd-fonts.symbols-only) version;
      pname = "nerd-font-fontconfig";
      src = fetchurl {
        url = "https://raw.githubusercontent.com/ryanoasis/nerd-fonts/v${nerd-fonts.symbols-only.version}/10-nerd-font-symbols.conf";
        hash = "sha256-E95Bcx58kZrHa/wELcroZXY6WzDgFBQlOCXROZr39c8=";
      };
      dontUnpack = true;
      dontConfigure = true;
      dontBuild = true;
      installPhase = ''
        runHook preInstall

        fontconfigdir="$out/etc/fonts/conf.d"
        install -d "$fontconfigdir"
        install "$src" "$fontconfigdir/10-nerd-font-symbols.conf"

        runHook postInstall
      '';
      enableParallelBuilding = true;
    })
  ];

  fonts.fontconfig.enable = true;
  fonts.fontconfig.defaultFonts.monospace = [ "Iosevka" ];

  programs.waybar = {
    enable = true;
    systemd.enable = true;
  };
  services.dunst.enable = true;
  services.network-manager-applet.enable = true;

}
