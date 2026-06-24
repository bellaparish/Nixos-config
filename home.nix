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
  programs.bash = {
    enable = true;
    shellAliases = {
        btw = "echo I use nixos, btw";
    };
    profileExtra = ''
    if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" = 1]; then
	exec hyprland
    fi
    '';
  };
  home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
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
      size = 11;
    };
  };
  home.file.".config/hypr".source = config/hypr;
  home.file.".config/waybar".source = config/waybar;
}
