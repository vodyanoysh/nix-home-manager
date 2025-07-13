{ config, pkgs, ... }:

{
  imports = [
    ./bash.nix
    ./fish.nix
    ./git.nix
    ./starship.nix
    ./ghostty.nix
    ./tmux.nix
    ./anyrun.nix
    ./waybar.nix
  ];
}
