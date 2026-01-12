{
  description = "Multi-user, multi-host Nix dotfiles";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    nixvim = {
      url = "github:nix-community/nixvim/nixos-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      nixvim,
      ...
    }:
    let
      mkHome = import ./lib/mkHome.nix;
    in
    {
      homeConfigurations = {
        company = mkHome {
          inherit nixpkgs home-manager nixvim;
          user = "huytq1";
          host = "desktop-qc513t6-wsl";
          system = "x86_64-linux";
        };

        personal = mkHome {
          inherit nixpkgs home-manager nixvim;
          user = "quochuy242";
          host = "my-laptop";
          system = "x86_64-linux";
        };
      };
    };
}
