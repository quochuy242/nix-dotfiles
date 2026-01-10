{
  nixpkgs,
  home-manager,
  system,
  user,
  host,
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
      ;
  };

  modules = [
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
