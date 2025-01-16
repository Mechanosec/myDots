{ config, pkgs, ... }:

{
  home = {
    username = "mechanosec";
    homeDirectory = "/home/mechanosec";
    stateVersion = "24.05"; # Please read the comment before changing.
  #home.packages = [];
  #home.file = {};
  #home.sessionVariables = {
  #  # EDITOR = "emacs";
  #};
  };

  home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
  };

  gtk = {
    enable = true;

    theme = {
      name = "Arc-Dark";
      package = pkgs.arc-theme;
    };

    font = {
      name = "Sans";
      size = 11;
    };
  };

  programs.git = {
    enable = true;
    userName = "O.Krasovskyi";
    userEmail = "mechanosec29@gmail.com";
  };



  # Let Home Manager install and manage itself.
  #programs.home-manager.enable = true;
}
