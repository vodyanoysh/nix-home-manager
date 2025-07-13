{ config, pkgs, ... }:

{
  # Пакеты, устанавливаемые через Home Manager
  home.packages = with pkgs; [
    # Инструменты разработки
    git
    neovim
    vscode
    uv
    python313Full
    lazygit
    lazydocker
    postgresql
    gcc
    gnumake
    cmake
    pkg-config
    ruff
    
    nodejs
    docker-compose
    
    luajit         # LuaJIT (ускоренная версия Lua 5.1, обратно совместимая)
    luarocks       # Менеджер пакетов Lua (необходим для image.nvim)
    imagemagick    # ImageMagick для обработки изображений
    libwebp        # WebP поддержка
    libjpeg_turbo  # JPEG поддержка
    libpng         # PNG поддержка
    
    
    # LSP серверы для Neovim
    nodePackages.typescript-language-server # TypeScript/JavaScript
    nodePackages.vscode-langservers-extracted # HTML/CSS/JSON
    lua-language-server # Lua
    nil # Nix
    pyright # Python
    
    # Инструменты для форматирования и линтинга
    nodePackages.prettier
    stylua
    nixpkgs-fmt
    black
    
    
    # Терминальные инструменты
    wget
    wl-clipboard
    curl
    btop
    tmux
    bat
    fzf
    yazi
    ripgrep
    zoxide
    tree
    iwd

    # Эмуляторы терминала
    ghostty
    alacritty
    
    # Браузеры
    qutebrowser
    
    # Мультимедиа
    vlc
    
    # Коммуникационные инструменты
    telegram-desktop
    spotify
    
    gnome-font-viewer

    
    # Оболочки и утилиты
    fish
    fastfetch
    starship
  ];
}
