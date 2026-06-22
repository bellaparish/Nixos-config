{config, pkgs, ...}:



{
  home.username = "bella";
  home.homeDirectory = "/home/bella";
  programs.git = {
    enable = true;
    userName = "Bella";
    userEmail = "bellaparish05@gmail.com";
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
}
