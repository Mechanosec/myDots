{ pkgs, ... }: {

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
    #ELECTRON_OZONE_PLATFORM_HINT = "auto";
  };

  environment.systemPackages = with pkgs; [
    swaynotificationcenter
    swayosd
    hyprlock
    hypridle
    hyprpaper
    wl-clipboard
    wofi
    rofi-wayland
    #dunst
    waybar
  ];
}
