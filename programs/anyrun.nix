{
  inputs,
  pkgs,
  ...
}: {
  programs.anyrun = {
    enable = true;
    config = {
      plugins = with inputs.anyrun.packages.${pkgs.system}; [
        applications
        rink  
        shell
      ];

      width.fraction = 0.3;
      y.fraction = 0.3;
      hidePluginInfo = true;
      closeOnClick = true;
    };

    extraCss = builtins.readFile ./files/anyrun/style-dark.css;

    extraConfigFiles = {
      "applications.ron".text = ''
        Config(
          desktop_actions: false,
          max_entries: 5,
          terminal: Some("ghostty"),
        )
      '';
    };
  };
}

