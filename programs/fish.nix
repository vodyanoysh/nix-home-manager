{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
      zoxide init fish | source
    '';
    shellAliases = {
      hm = "home-manager";
      va = "source .venv/bin/activate.fish";
    };
  };
}
