# {
#   description = "Home Manager configuration";
#
#   inputs = {
#     nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
#     home-manager = {
#       url = "github:nix-community/home-manager";
#       inputs.nixpkgs.follows = "nixpkgs";
#     };
#     niri-flake = {
#       url = "github:sodiboo/niri-flake";
#       inputs.nixpkgs.follows = "nixpkgs";
#     };
#     anyrun.url = "github:anyrun-org/anyrun";
#   };
#
#   outputs = { nixpkgs, home-manager, niri-flake, anyrun, ... }@inputs:
#     let
#       system = "x86_64-linux";
#       pkgs = nixpkgs.legacyPackages.${system};
#     in {
#       homeConfigurations."vodyanoy" = home-manager.lib.homeManagerConfiguration {
#         inherit pkgs;
#         extraSpecialArgs = { inherit inputs; };
#         modules = [
#           ./home.nix
#           niri-flake.homeModules.niri
#         ];
#       };
#     };
# }
#


{
  description = "vodyanoy nixos configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri-flake = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    anyrun.url = "github:anyrun-org/anyrun";
  };

  outputs = { self, nixpkgs, home-manager, niri-flake, anyrun, ... }@inputs: {
    nixosConfigurations = {
      # Здесь используется имя вашей системы, должно совпадать с hostname
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/nixos/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.vodyanoy = import ./home.nix;
            home-manager.extraSpecialArgs = { inherit inputs; };
          }
        ];
      };
    };
  };
}

