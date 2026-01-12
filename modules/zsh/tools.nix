{ pkgs, ... }:

{
  programs.zoxide.enable = true;
  programs.zoxide.enableZshIntegration = true;
  programs.atuin.enable = true;
  programs.atuin.enableZshIntegration = true;
  programs.yazi.enableZshIntegration = true;
  programs.lazygit.enableZshIntegration = true;
  programs.fzf = {
    enable = true;

    # dùng fd thay cho find
    defaultCommand = "fd --hidden --strip-cwd-prefix --exclude .git";
    fileWidgetCommand = "fd --hidden --strip-cwd-prefix --exclude .git";
    changeDirWidgetCommand = "fd --type=d --hidden --strip-cwd-prefix --exclude .git";

    defaultOptions = [
      # ---- theme ----
      "--color=bg:#1a1b26,bg+:#24283b,fg:#c0caf5,fg+:#c0caf5"
      "--color=hl:#7aa2f7,hl+:#7dcfff"
      "--color=info:#e0af68,marker:#9ece6a"
      "--color=prompt:#7aa2f7,spinner:#bb9af7,pointer:#f7768e"
      "--color=header:#565f89,border:#565f89,label:#a9b1d6,query:#c0caf5"
      "--preview-window=border-sharp"
      "--prompt=​​​"
      "--marker=✓ "
      "--pointer=▶ "
      "--separator=-"
      "--scrollbar=│"
      "--layout=reverse"
    ];

    # CTRL-T
    fileWidgetOptions = [
      "--preview 'if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi'"
    ];

    # ALT-C
    changeDirWidgetOptions = [
      "--preview 'eza --tree --color=always {} | head -200'"
    ];

    enableZshIntegration = true;
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
