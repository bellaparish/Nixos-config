{config, pkgs, ...}:



{
  home.username = "bella";
  home.homeDirectory = "/home/bella";
  programs.git = {
    enable = true;
    settings.user.name = "Bella";
    settings.user.email = "bellaparish05@gmail.com";
  };
  home.stateVersion = "26.05";
  programs.fish = {
    enable = true;
    shellAliases = {
	btw = "echo i use nixos btw";
	".." = "cd ..";
  };
    interactiveShellInit = ''
	set fish_greeting # Disable greeting
  '';
  };
  home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true;
    package = pkgs.adwaita-cursor-theme;
    name = "Awaita";
    size = 24;
  };

  gtk = {
    enable = true;

    theme = {
      package = pkgs.flat-remix-gtk;
      name = "Flat-Remix-GTK-Grey-Darkest";
    };

    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };

    font = {
      name = "Sans";
      size = 12;
    };
  };
  home.file.".config/hypr".source = config/hypr;
  home.file.".config/waybar".source = config/waybar;
  home.file.".config/kitty".source = config/kitty;
}
