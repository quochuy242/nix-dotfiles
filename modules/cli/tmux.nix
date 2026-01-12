{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    historyLimit = 10000;
    mouse = true;
    baseIndex = 1;

    extraConfig = ''
      set -g set-clipboard on         # use system clipboard
      set -g detach-on-destroy off    # don't exit from tmux when closing a session
      set -g escape-time 0            # remove delay for exiting insert mode with ESC in Neovim
      set -g status-interval 2        # update the status bar every 2 seconds
      set-option -g default-shell "$SHELL" # set up current shell is default
      set -g default-terminal "screen-256color"
      set -ga terminal-overrides ",*256col*:Tc"
      set-option -g focus-events on
      set-option -g pane-active-border-style fg=blue
      set -g pane-base-index 1
      set-option -g renumber-windows on
      set -g allow-passthrough all
      set -g visual-activity off
      set -ga update-environment TERM
      set -ga update-environment TERM_PROGRAM
      set -as terminal-overrides ',*:Smulx=\E[4::%p1%dm' # undercurl support

      # Set new prefix key
      set -g prefix C-a
      unbind C-b
      bind-key C-a send-prefix

      # Split
      unbind %
      bind '\' split-window -h
      unbind '"'
      bind - split-window -v
      bind-key x kill-pane # Skip confirm y/n'

      # Detach
      bind d detach-client

      # Launch floating app
      bind g display-popup -d "#{pane_current_path}" -xC -yC -w95% -h90% -B -E -e "TMUX_POPUP=1" 'lazygit'
      bind f display-popup -d "#{pane_current_path}" -xC -yC -w95% -h90% -B -E -e "TMUX_POPUP=1" 'yazi'
      bind t display-popup -d "#{pane_current_path}" -xC -yC -w95% -h90% -E
      bind D display-popup -d "#{pane_current_path}" -xC -yC -w95% -h90% -B -E -e "TMUX_POPUP=1" 'lazydocker'
      bind B display-popup -d "#{pane_current_path}" -xC -yC -w95% -h90% -B -E -e "TMUX_POPUP=1" 'btop'

      # New window in same path
      bind c new-window

      # Use vim arrow keys to resize
      bind -r j resize-pane -D 5
      bind -r k resize-pane -U 5
      bind -r l resize-pane -R 5
      bind -r h resize-pane -L 5

      # Use m key to maximize pane
      bind -r m resize-pane -Z

      # Enable vi mode to allow vim movements
      set-window-option -g mode-keys vi
      bind-key -T copy-mode-vi 'Escape' send -X cancel # Bind Esc to exit copy-mod

      # Start selecting text with "v"
      bind-key -T copy-mode-vi 'v' send -X begin-selection

      # Paste yanked text with "Prefix + P" ("Prefix + p" goes to previous window)
      bind P paste-buffer

      # Don't exit copy mode when dragging with mouse
      unbind -T copy-mode-vi MouseDragEnd1Pane

      bind r source-file ~/.config/tmux/tmux.conf \; display-message "Config reloaded!"
    '';

    plugins = with pkgs.tmuxPlugins; [
      vim-tmux-navigator
      tmux-fzf
      {
        plugin = yank;
        extraConfig = ''
          set -g @yank_action 'copy-pipe-and-cancel'
        '';
      }
      {
        plugin = resurrect;
        extraConfig = ''
          set -g @resurrect-capture-pane-contents 'on'
          set -g @resurrect-strategy-nvim 'session'
          set -g @resurrect-strategy-vim 'session'
        '';
      }
      {
        plugin = continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-save-interval '10' # minutes
          set -g @continuum-boot 'on'
        '';
      }
      {
        plugin = tokyo-night-tmux;
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

  programs.fzf.tmux.enableShellIntegration = true;
  programs.sesh = {
    enable = true;
    enableTmuxIntegration = true;
    tmuxKey = "T";
  };

  home.packages = with pkgs; [
    tmux
    fzf
    lazygit
    btop
    sesh
    yazi
  ];

}
