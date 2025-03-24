# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL

{ inputs, pkgs, ... }:

{
  wsl.enable = true;
  wsl.defaultUser = "aria";
  networking.hostName = "wsl";

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  environment.systemPackages = with pkgs; [
    git
    wget
    clang
    ripgrep
    fd
    eza
    file
    atool
    zip
    unzip
    file
    htop
    rsync
    tmux

    inputs.neovim-nightly.packages.${pkgs.system}.default
    nix-output-monitor
    nixfmt-rfc-style
  ];

  programs = {
    mosh.enable = true;
    zsh.enable = true;
    nix-ld.enable = true;
  };

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.aria = import ./home.nix;
  users.defaultUserShell = pkgs.zsh;

  environment.variables.EDITOR = "nvim";

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
