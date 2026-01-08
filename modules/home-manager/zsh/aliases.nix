{
  programs.zsh.shellAliases = {
    ".." = "cd ..";
    "..." = "cd ../..";
    "...." = "cd ../../..";

    l = "eza -la --icons --group-directories-first";
    ll = "eza -lha --icons --group-directories-first";
    lt = "eza --tree --level=3 --icons";
    ls = "eza --icons --all";

    py = "python3";
    pyac = "source .venv/bin/activate";
    pydeac = "deactivate";

    nv = "nvim";
    vi = "nvim";

    gaa = "git add .";
    gcm = "git commit";
    gps = "git push";
    gpl = "git pull";
    gst = "git status";
    grt = "git restore";

    hm = "nix run github:nix-community/home-manager --";

  };
}
