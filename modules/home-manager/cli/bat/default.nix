{ ... }:

{
  programs.bat = {
    enable = true;

    themes = {
      tokyo_night = {
        src = ./tokyo_night.tmTheme;
      };
    };

    config = {
      theme = "tokyo_night";
    };
  };
}
