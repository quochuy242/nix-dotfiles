{
  nixpkgs,
  home-manager,
  nvf,
  system,
  user,
  host,
}:

let
  pkgs = nixpkgs.legacyPackages.${system};

  mkNvf = import ./mkNvf.nix { inherit nvf; };

  nvfCustomConfig = mkNvf {
    inherit pkgs;
  };
in
home-manager.lib.homeManagerConfiguration {
  inherit pkgs;

  extraSpecialArgs = {
    inherit
      user
      host
      system
      nvf
      ;
  };

  modules = [
    nvf.homeManagerModules.default

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
