{ pkgs, ... }:

{
  fonts = {
        enableDefaultFonts = true;
        fontconfig.enable = true;
        enableFontDir = true;
        #fontDir.enable = true;
        enableGhostscriptFonts = true;
        fonts = with pkgs; [
            sarasa-gothic
            noto-fonts
            noto-fonts-cjk
            noto-fonts-emoji
            wqy_microhei
            wqy_zenhei

        ];
  };
}
