{ ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;

    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    history = {
      path = "$HOME/.zhistory";
      size = 10000;
      save = 10000;
      ignoreAllDups = true;
      ignoreSpace = true;
      share = true;
    };

    setOptions = [
      "autocd"
      "correct"
      "interactivecomments"
      "magicequalsubst"
      "nonomatch"
      "notify"
      "numericglobsort"
      "promptsubst"
    ];
  };
}
