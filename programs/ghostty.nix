{ config, pkgs, ... }:

{
  xdg.configFile."ghostty/config".text = ''
    theme = zenwritten_dark
    font-family = "JetBrainsMono NF"
    font-family-bold = "JetBrainsMono NF"
    font-size = 10
    cursor-style = block
    background-opacity = 0.90
    
    gtk-titlebar = false
    
    window-height = 50
    window-width = 170
    
    # Горячие клавиши
    keybind = ctrl+g>r=reload_config
    keybind = ctrl+g>c=new_tab
    keybind = ctrl+g>x=close_surface
    
    keybind = ctrl+g>|=new_split:right
    keybind = ctrl+g>-=new_split:down
    
    keybind = ctrl+g>1=goto_tab:1
    keybind = ctrl+g>2=goto_tab:2
    keybind = ctrl+g>3=goto_tab:3
    keybind = ctrl+g>4=goto_tab:4
    keybind = ctrl+g>5=goto_tab:5
  '';
  
}
