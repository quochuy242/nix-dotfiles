{
  programs.zsh.initContent = ''
    cpp() {
      if command -v rsync >/dev/null; then
        rsync -ah --info=progress2 "$1" "$2"
      else
        cp "$1" "$2"
      fi
    }

    mkdg() {
      mkdir -p "$@" && cd "$@"
    }

    cpg() {
      cp "$1" "$2" && cd "$2"
    }

    mvg() {
      mv "$1" "$2" && cd "$2"
    }
  '';

}
