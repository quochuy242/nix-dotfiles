{
  programs.fzf = {
    enable = true;
    defaultOptions = [
      "--layout=reverse"
      "--border"
      "--prompt=🔍 "
      "--marker=✓"
      "--pointer=▶"
    ];
  };

  home.sessionVariables = {
    FZF_DEFAULT_COMMAND = "fd --hidden --exclude .git";
  };
}
