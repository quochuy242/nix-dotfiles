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

    ga = "git add";
    gaa = "git add .";
    gcm = "git commit";
    gps = "git push";
    gpl = "git pull";
    gst = "git status";
    grt = "git restore";
    grta = "git restore .";
    gco = "git checkout";
    gcob = "git checkout -b";

    hm = "home-manager";
    ff = "fastfetch";

  };
}
