{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";

    lix-module.url = "https://git.lix.systems/lix-project/nixos-module/archive/main.tar.gz";
    lix-module.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    neovim-nightly.url = "github:nix-community/neovim-nightly-overlay";
    neovim-nightly.inputs.nixpkgs.follows = "nixpkgs";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      nixos-wsl,
      lix-module,
      home-manager,
      neovim-nightly,
      nixos-hardware,
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
            nixos-hardware.nixosModules.lenovo-thinkpad-x1-extreme-gen2
            ./iapetus.nix
            {
              _module.args = { inherit inputs; };
            }
          ];
        };
      };
    };
}
