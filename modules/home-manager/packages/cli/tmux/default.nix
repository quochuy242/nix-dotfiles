{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    terminal = "screen-256color";
    baseIndex = 1;
    keyMode = "vi";
    mouse = true;

    extraConfig = builtins.readFile ./tmux.conf;
    plugins = with pkgs; [
      tmuxPlugins.vim-tmux-navigator
      tmuxPlugins.tmux-fzf
      {
        plugin = tmuxPlugins.resurrect;
        extraConfig = "set -g @resurrect-capture-pane-contents 'on'";
      }
      {
        plugin = tmuxPlugins.continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-save-interval '5' # minutes
        '';
      }
      {
        plugin = tmuxPlugins.tokyo-night-tmux;
        extraConfig = ''
          # Config the theme
          set -g @tokyo-night-tmux_theme night    # storm | day | default to 'night'
          set -g @tokyo-night-tmux_transparent 1  # 1 or 0
          set -g @tokyo-night-tmux_window_id_style none
          set -g @tokyo-night-tmux_pane_id_style hide
          set -g status-position top

          ## Date widget
          set -g @tokyo-night-tmux_show_datetime 0
          set -g @tokyo-night-tmux_date_format MYD
          set -g @tokyo-night-tmux_time_format 12H

          ## Icon styles
          set -g @tokyo-night-tmux_terminal_icon 
          set -g @tokyo-night-tmux_active_terminal_icon 

          ## No extra spaces between icons
          set -g @tokyo-night-tmux_window_tidy_icons 0

          ## Path widget
          set -g @tokyo-night-tmux_show_path 1
          set -g @tokyo-night-tmux_path_format relative # 'relative' or 'full'

          ## Network speed widget
          set -g @tokyo-night-tmux_show_netspeed 1
          set -g @tokyo-night-tmux_netspeed_iface "wlan0" # Detected via default route
          set -g @tokyo-night-tmux_netspeed_showip 0      # Display IPv4 address (default 0 - not showing)
          set -g @tokyo-night-tmux_netspeed_refresh 2     # Update interval in seconds (default 1)

          ## Music player widget
          set -g @tokyo-night-tmux_show_music 0 # Not showing the music player
        '';
      }
    ];
  };

  programs.sesh.enableTmuxIntegration = true;
  home.packages = with pkgs; [
    tmux
    fzf
    lazygit
    btop
    sesh
  ];

}
