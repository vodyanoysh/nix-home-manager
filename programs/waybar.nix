{
  pkgs,
  ...
}: {
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
    
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 10;
        spacing = 3;
        margin-top = 0;
        margin-left = 0;
        margin-right = 0;

        modules-left = [];
        modules-center = ["clock"];
        modules-right = ["network" "pulseaudio" "battery" "custom/power" "memory" "cpu"];

        "custom/launcher" = {
          format = " ";
          on-click = "anyrun";
          tooltip = false;
        };

        "custom/power" = {
          format = " ";
          on-click = "wlogout";
          tooltip = false;
        };
    
        clock = {
          format = "{:%Y-%m-%d %H:%M:%S}";
          format-alt = "{:%A, %B %d, %Y (%R)}";
          interval = 1;
          tooltip-format = "<tt><small>{calendar}</small></tt>";
        };
    
        cpu = {
          format = " {usage}%";
          interval = 5;
          tooltip = false;
          on-click = "ghostty -e btop";
        };
    
        memory = {
          format = " {percentage}%";
          interval = 5;
          tooltip-format = "{used:0.1f}GB / {total:0.1f}GB";
        };

        # temperature = {
        #   format = "Temp: {temp}°C";
        #   sensors = ["coretemp"];
        #   interval = 5;
        #   tooltip-format = "{temp}°C";
        # };
    
        network = {
          format-wifi = "  {signalStrength}%";
          format-ethernet = " {ifname}";
          format-linked = " {ifname} (No IP)";
          format-disconnected = "⚠ Disconnected";
          tooltip-format = "{ifname} via {gwaddr} ssid {essid} ({signalStrength}%)";
        };
    
        pulseaudio = {
          format = "{icon} {volume}%";
          format-muted = "🔇";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = ["🔈" "🔉" "🔊"];
          };
          on-click = "pavucontrol";
        };

    
        battery = {
          bat = "BAT0";
          interval = 60;
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}%";
          format-charging = " {capacity}%";
          format-plugged = " {capacity}%";
          format-alt = "{icon} {time}";
          format-icons = ["" "" "" "" ""];
        };
      };
    };
    
    style = builtins.readFile ./files/waybar/classic/style.css;

  };

  # Установим необходимые пакеты
  home.packages = with pkgs; [
    pavucontrol
    wlogout
    btop
    nerd-fonts.jetbrains-mono
  ];
}
