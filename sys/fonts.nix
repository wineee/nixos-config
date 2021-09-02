{ pkgs, ... }:

{
  fonts = {
        enableDefaultFonts = true;
        fontconfig = {
 	    enable = true;
	    defaultFonts.emoji = [ "Noto Color Emoji" ];
            defaultFonts.monospace = [ "Hack" "Sarasa Mono SC" ];
            #defaultFonts.sansSerif = [ "Inter" "Liberation Sans" "Soruce Han Sans SC" ];
            #defaultFonts.serif = [ "Liberation Serif" "Source Han Serif SC" ];
                
	};
        
        fontDir.enable = true;
        enableGhostscriptFonts = true;
        fonts = with pkgs; [
            sarasa-gothic
            noto-fonts
            noto-fonts-cjk
            noto-fonts-emoji
            wqy_microhei
            wqy_zenhei
	    nerdfonts # 图标字体
            symbola  # 特殊字符
        ];
  };
}
