{
  description = "My NixOS Configuration flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf.url = "github:notashelf/nvf";
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nixos-wsl,
    nvf,
    noctalia,
    ...
  } @ inputs: {
    nixosConfigurations.wsl = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/wsl.nix

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.sharedModules = [nvf.homeManagerModules.default];
          home-manager.users.andrea = import ./users/andrea;
          home-manager.extraSpecialArgs = {
            headless = true;
          };
        }

        nixos-wsl.nixosModules.default
        {
          system.stateVersion = "24.11";
          wsl.enable = true;
          wsl.defaultUser = "andrea";
          wsl.startMenuLaunchers = true;
          wsl.usbip.enable = true;
        }
      ];
    };
    nixosConfigurations.dell14s = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/dell14s

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "bak";
          home-manager.overwriteBackup = true;
          home-manager.sharedModules = [
            nvf.homeManagerModules.default
            noctalia.homeModules.default
          ];
          home-manager.users.andrea = import ./users/andrea;
          home-manager.extraSpecialArgs = {
            headless = false;
          };
        }
      ];
    };
  };
}
