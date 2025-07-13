{ config, pkgs, ... }:

{
  imports = [
    ./binds.nix
    ./settings.nix
    ./rules.nix
  ];

    home.packages = with pkgs; [
        niri
        waybar
        hyprlock
        wl-clipboard
        slurp
        grim
        clipman
  ];

}
