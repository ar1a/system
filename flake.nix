{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";

    lix-module.url = "https://git.lix.systems/lix-project/nixos-module/archive/main.tar.gz";
    lix-module.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-index-database.url = "github:nix-community/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";

    neovim-nightly.url = "github:nix-community/neovim-nightly-overlay";
    neovim-nightly.inputs.nixpkgs.follows = "nixpkgs";

    catppuccin.url = "github:catppuccin/nix";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      nixos-wsl,
      lix-module,
      home-manager,
      nix-index-database,
      neovim-nightly,
      nixos-hardware,
      catppuccin,
      ...
    }:
    {
      nixosConfigurations = {
        wsl = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            nixos-wsl.nixosModules.default
            lix-module.nixosModules.default
            home-manager.nixosModules.home-manager
            nix-index-database.nixosModules.nix-index
            ./wsl.nix
            {
              _module.args = { inherit inputs; };
            }
          ];
        };
        iapetus = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            lix-module.nixosModules.default
            home-manager.nixosModules.home-manager
            nix-index-database.nixosModules.nix-index
            nixos-hardware.nixosModules.lenovo-thinkpad-x1-extreme-gen2
            catppuccin.nixosModules.catppuccin
            ./iapetus.nix
            {
              _module.args = { inherit inputs; };
            }
          ];
        };
      };
    };
}
