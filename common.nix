{ inputs, pkgs, ... }:

{

  time.timeZone = "Australia/Perth";

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
  users.defaultUserShell = pkgs.zsh;

  environment.variables.EDITOR = "nvim";

}
