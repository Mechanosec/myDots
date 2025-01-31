{ pkgs, ... }: {

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
    MOZ_ENABLE_WAYLAND = "1";
    PULSE_SERVER = "unix:/run/user/1000/pulse/native";
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
