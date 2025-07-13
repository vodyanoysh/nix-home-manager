{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    shellAliases = {
      hm = "home-manager";
    };
  };
}
