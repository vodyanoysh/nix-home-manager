{
  config,
  pkgs,
  ...
}: {
  programs.niri.settings.binds = with config.lib.niri.actions; let
    set-volume = spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@";
    brillo = spawn "${pkgs.brillo}/bin/brillo" "-q" "-u" "300000";
    playerctl = spawn "${pkgs.playerctl}/bin/playerctl";
  in {
    # ===Управление звуком и мультимедиа===
    "XF86AudioMute".action = spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle";
    "XF86AudioMicMute".action = spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SOURCE@" "toggle";
    "XF86AudioPlay".action = playerctl "play-pause";
    "XF86AudioStop".action = playerctl "pause";
    "XF86AudioPrev".action = playerctl "previous";
    "XF86AudioNext".action = playerctl "next";
    "XF86AudioRaiseVolume".action = set-volume "5%+";
    "XF86AudioLowerVolume".action = set-volume "5%-";
    "XF86MonBrightnessUp".action = brillo "-A" "5";
    "XF86MonBrightnessDown".action = brillo "-U" "5";
    
    # ===Управление скриншотами===
    "Print".action.screenshot-screen = {write-to-disk = true;};
    "Mod+Shift+Alt+S".action = screenshot-window;
    "Mod+Shift+S".action.screenshot = {show-pointer = false;};

    # ===Запуск приложений===
    "Mod+D".action = spawn "${pkgs.anyrun}/bin/anyrun";
    "Mod+T".action = spawn "${pkgs.ghostty}/bin/ghostty";
    "Ctrl+Alt+L".action = spawn "sh" "-c" "pgrep hyprlock || hyprlock";
    "Mod+U".action = spawn "sh" "-c" "env XDG_CURRENT_DESKTOP=gnome gnome-control-center";

    "Mod+Q".action = close-window; # Закрыть текущее окно
    "Mod+S".action = switch-preset-column-width; # Переключить ширину столбца между предустановками
    "Mod+F".action = maximize-column; # Максимизировать текущий столбец
    "Mod+Shift+F".action = toggle-window-floating; # Переключить текущее окно в плавающий режим
    "Mod+W".action = toggle-column-tabbed-display; # Переключить отображение столбца в виде вкладок
    "Mod+Comma".action = consume-window-into-column; # Переместить текущее окно в столбец
    "Mod+Period".action = expel-window-from-column; # Изъять текущее окно из столбца
    "Mod+C".action = center-visible-columns; # Центрировать видимые столбцы
    "Mod+Tab".action = switch-focus-between-floating-and-tiling; # Переключить фокус между плавающим и тайлинговым окнами

    "Mod+Minus".action = set-column-width "-10%"; # Уменьшить ширину текущего столбца на 10%
    "Mod+Plus".action = set-column-width "+10%"; # Увеличить ширину текущего столбца на 10%
    "Mod+Shift+Minus".action = set-window-height "-10%"; # Уменьшить высоту текущего окна на 10%
    "Mod+Shift+Plus".action = set-window-height "+10%"; # Увеличить высоту текущего окна на 10%

    "Mod+H".action = focus-column-left; # Переключить фокус на столбец слева
    "Mod+L".action = focus-column-right; # Переключить фокус на столбец справа
    "Mod+J".action = focus-window-or-workspace-down; # Переключить фокус на окно или рабочее пространство ниже
    "Mod+K".action = focus-window-or-workspace-up; # Переключить фокус на окно или рабочее пространство выше
    "Mod+Left".action = focus-column-left; # Переключить фокус на столбец слева
    "Mod+Right".action = focus-column-right; # Переключить фокус на столбец справа
    "Mod+Down".action = focus-workspace-down; # Переключить фокус на рабочее пространство ниже
    "Mod+Up".action = focus-workspace-up; # Переключить фокус на рабочее пространство выше

    "Mod+Shift+H".action = move-column-left; # Переместить текущий столбец влево
    "Mod+Shift+L".action = move-column-right; # Переместить текущий столбец вправо
    "Mod+Shift+K".action = move-column-to-workspace-up; # Переместить текущий столбец на рабочее пространство выше
    "Mod+Shift+J".action = move-column-to-workspace-down; # Переместить текущий столбец на рабочее пространство ниже

    "Mod+Shift+Ctrl+J".action = move-column-to-monitor-down; # Переместить текущий столбец на монитор ниже
    "Mod+Shift+Ctrl+K".action = move-column-to-monitor-up; # Переместить текущий столбец на монитор выше
  };
}
