{ pkgs, ... }:
{
  home.username = "aria";
  home.homeDirectory = "/home/aria";

  home.packages = with pkgs; [
    htop
    btop
    chezmoi
    fastfetch
    jq
    bat
    nodejs
    fzf
    nixd

    lazygit
    zoxide

    python3

    rustup
    lldb
    xxd
  ];

  programs = {
    git.enable = true;
  };

  # don't touch
  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}
