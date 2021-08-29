{ pkgs, ... }:

{
  fonts = {
        enableDefaultFonts = true;
        fontconfig = {
 		enable = true;
		defaultFonts.emoji = [
 			 "Noto Color Emoji"
		];
                
	};
        #enableFontDir = true;
        fontDir.enable = true;
        enableGhostscriptFonts = true;
        fonts = with pkgs; [
            sarasa-gothic
            noto-fonts
            noto-fonts-cjk
            noto-fonts-emoji
            wqy_microhei
            wqy_zenhei
	    nerdfonts
        ];
  };
}
