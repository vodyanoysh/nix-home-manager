{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "vodyanoy";
    userEmail = "vodyanoy.sh@gmail.com";
  };
}
