{
  nixpkgs,
  home-manager,
  system,
  user,
  host,
  nixvim,
  rust-overlay,
}:

let
  pkgs = import nixpkgs {
    inherit system;
    overlays = [
      rust-overlay.overlays.default
      (import ../overlays/rust.nix)
    ];
  };
in
home-manager.lib.homeManagerConfiguration {
  inherit pkgs;

  extraSpecialArgs = {
    inherit
      user
      host
      system
      nixvim
      ;
  };

  modules = [
    nixvim.homeModules.nixvim

    ../homes/${user}
    ../hosts/${host}
    ../systems/${system}
    ../systems/${system}/${host}

    {
      home.username = user;
      home.homeDirectory = "/home/${user}";
      home.stateVersion = "25.11";
    }
  ];
}
