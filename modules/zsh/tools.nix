{ pkgs, ... }:

{
  programs.zoxide.enable = true;
  programs.zoxide.enableZshIntegration = true;
  programs.atuin.enable = true;
  programs.atuin.enableZshIntegration = true;
  programs.yazi.enableZshIntegration = true;
  programs.lazygit.enableZshIntegration = true;
  programs.fzf.enableZshIntegration = true;
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

  home.packages = with pkgs; [
    eza
    fastfetch
    fd
    ripgrep
    pure-prompt
    rsync
  ];
}
