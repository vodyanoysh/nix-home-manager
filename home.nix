{ config, pkgs, inputs, ... }:

{
  imports = [
    ./programs
    ./services
    ./pkgs
    ./themes
    ./wm
    inputs.niri-flake.homeModules.niri
  ];

  home.username = "vodyanoy";
  home.homeDirectory = "/home/vodyanoy";
  home.stateVersion = "25.05";
  nixpkgs.config.allowUnfree = true;

  home.file = {
    # Здесь можно добавлять пользовательские файлы, если нужно
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    TERMINAL = "ghostty";
  };
  
  home.shellAliases = {};
  targets.genericLinux.enable = true;
  programs.home-manager.enable = true;
}
