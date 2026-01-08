{
  description = "Multi-user multi-host Nix dotfiles";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    { nixpkgs, home-manager, ... }:
    let
      mkHome = import ./lib/mkHome.nix;
    in
    {
      homeConfigurations = {
        "huytq1@desktop-qc513t6-wsl" = mkHome {
          inherit nixpkgs home-manager;
          user = "huytq1";
          host = "desktop-qc513t6-wsl";
          system = "x86_64-linux";
        };

        "quochuy242@desktop-qc513t6-wsl" = mkHome {
          inherit nixpkgs home-manager;
          user = "quochuy242";
          host = "desktop-qc513t6-wsl";
          system = "x86_64-linux";
        };

        "quochuy242@my-laptop" = mkHome {
          inherit nixpkgs home-manager;
          user = "quochuy242";
          host = "my-laptop";
          system = "x86_64-linux";
        };
      };
    };
}
