{
  nixpkgs,
  home-manager,
  system,
  user,
  host,
  nixvim
}:

let
  pkgs = nixpkgs.legacyPackages.${system};
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
    ../systems/${system}/${host}

    {
      home.username = user;
      home.homeDirectory = "/home/${user}";
      home.stateVersion = "25.11";
    }
  ];
}
