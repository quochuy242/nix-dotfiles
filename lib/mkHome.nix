{
  nixpkgs,
  home-manager,
  system,
  user,
  host,
}:

let
  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };
in
home-manager.lib.homeManagerConfiguration {
  inherit pkgs;

  extraSpecialArgs = {
    inherit user host system;
  };

  modules = [
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
