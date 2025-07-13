{ config, pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    mouse = true;
    baseIndex = 1;
    keyMode = "vi";
    prefix = "C-f";
    sensibleOnTop = false;
    terminal = "screen-256color";
    
    extraConfig = ''
      # Отображение цветов
      set -g default-terminal "screen-256color"
      
      # Разделение окон
      unbind %
      bind | split-window -h
      
      unbind '"' 
      bind - split-window -v
      
      # Перезагрузка конфига
      unbind r
      bind r source-file ~/.config/tmux/tmux.conf
      
      # Изменение размера панелей
      bind -r j resize-pane -D 5
      bind -r k resize-pane -U 5
      bind -r l resize-pane -R 5
      bind -r h resize-pane -L 5
      
      # Сортировка по имени
      bind s choose-tree -sZ -O name
      
      # Изменение индексов панелей
      setw -g pane-base-index 1
      
      # Настройки плагинов
      set -g @tmux_power_theme 'cyan'
      set -g @resurrect-capture-pane-contents 'on'
      set -g @continuum-restore 'on'
    '';
    
    plugins = [
      {
        plugin = pkgs.tmuxPlugins.sensible;
        extraConfig = "set -g @plugin 'tmux-plugins/tmux-sensible'";
      }
      {
        plugin = pkgs.tmuxPlugins.power-theme;
        extraConfig = "set -g @plugin 'wfxr/tmux-power'";
      }
      {
        plugin = pkgs.tmuxPlugins.vim-tmux-navigator;
        extraConfig = "set -g @plugin 'christoomey/vim-tmux-navigator'";
      }
      {
        plugin = pkgs.tmuxPlugins.resurrect;
        extraConfig = "set -g @plugin 'tmux-plugins/tmux-resurrect'";
      }
      {
        plugin = pkgs.tmuxPlugins.continuum;
        extraConfig = "set -g @plugin 'tmux-plugins/tmux-continuum'";
      }
      {
        plugin = pkgs.tmuxPlugins.sessionist;
        extraConfig = "set -g @plugin 'tmux-plugins/tmux-sessionist'";
      }
    ];
  };
}
