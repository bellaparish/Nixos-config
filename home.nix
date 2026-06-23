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
  home.file.".config/hypr".source = config/hypr;
  home.file.".config/waybar".source = config/waybar;
}
